import adapter from '@sveltejs/adapter-node';

export default {
  kit: {
    adapter: adapter({
      // default options are fine
    }),
    // Allow listening on environment-defined host & port
    vite: {
      server: {
        host: process.env.HOST || '0.0.0.0',
        port: process.env.PORT ? parseInt(process.env.PORT) : 3000
      }
    }
  }
};