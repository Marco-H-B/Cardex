import { defineConfig } from "@neon/config/v1";

export default defineConfig({
  preview: {
    buckets: {
      "card-images": { access: "public_read" },
    },
    functions: {
      api: { name: "api", source: "./hello.ts" },
    },
  },
});
