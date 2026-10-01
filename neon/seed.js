const fs = require('fs');
const path = require('path');
const { Client } = require('pg');
require('dotenv').config({ path: path.resolve(__dirname, '../.env.local') });

async function seedCatalog() {
    const connectionString = process.env.DATABASE_URL_UNPOOLED || process.env.DATABASE_URL;
    if (!connectionString) {
        throw new Error('DATABASE_URL no encontrada en .env.local');
    }

    const client = new Client({
        connectionString,
        ssl: { rejectUnauthorized: false }
    });

    console.log('📡 Conectando a Neon Lakebase Postgres...');
    await client.connect();

    try {
        console.log('👤 Creando perfil PRO inicial para Marco Antonio Huamani...');
        await client.query(`
            INSERT INTO public.profiles (id, email, full_name, subscription_tier, daily_scans_used)
            VALUES (
                '00000000-0000-0000-0000-000000000001',
                'marco.huamani.b@uni.pe',
                'Marco Antonio Huamani Bonifacio',
                'PRO',
                0
            )
            ON CONFLICT (id) DO UPDATE
            SET subscription_tier = 'PRO';
        `);

        console.log('🃏 Leyendo archivo SQL del Catálogo Maestro (177 Cartas)...');
        const sqlPath = path.resolve(__dirname, 'catalog_seed.sql');
        let sqlContent = fs.readFileSync(sqlPath, 'utf8');
        sqlContent = sqlContent.replace(/^\uFEFF/, '');

        console.log('⚡ Ejecutando transacción de inserción en Neon...');
        await client.query('BEGIN');
        await client.query(sqlContent);
        await client.query('COMMIT');

        const res = await client.query('SELECT COUNT(*) as total FROM public.cards_catalog;');
        console.log(`✅ ¡Catálogo inyectado con éxito! Total de cartas en cards_catalog: ${res.rows[0].total}`);

        const profileRes = await client.query('SELECT email, subscription_tier FROM public.profiles WHERE id = $1;', ['00000000-0000-0000-0000-000000000001']);
        console.log(`👤 Perfil verificado: ${profileRes.rows[0].email} [${profileRes.rows[0].subscription_tier}]`);
    } catch (err) {
        await client.query('ROLLBACK');
        console.error('❌ Error al inyectar catálogo en Neon:', err);
        process.exit(1);
    } finally {
        await client.end();
        console.log('🔌 Conexión cerrada.');
    }
}

seedCatalog();
