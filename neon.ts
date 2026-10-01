import { defineConfig } from "@neon/config/v1";

export default defineConfig({
  preview: {
    buckets: {
      "card-images": { access: "public_read" },
    },
    functions: {
      api: {
        name: "api",
        source: "./neon/functions/index.ts",
        env: {
          LEMONSQUEEZY_WEBHOOK_SECRET: process.env.LEMONSQUEEZY_WEBHOOK_SECRET!,
        },
      },
    },
  },
});
