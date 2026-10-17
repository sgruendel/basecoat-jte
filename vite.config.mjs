import { fileURLToPath } from 'node:url';
import { resolve } from 'node:path';
import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';

const projectDir = fileURLToPath(new URL('.', import.meta.url));
const resourcesDir = resolve(projectDir, 'src/main/resources');
const templatesDir = resolve(projectDir, 'src/main/jte');

export default defineConfig({
  root: resourcesDir,
  publicDir: false,
  cacheDir: resolve(projectDir, 'node_modules/.vite'),
  appType: 'custom',
  plugins: [
    tailwindcss(),
    {
      name: 'jte-reload',
      configureServer(server) {
        server.watcher.add(templatesDir);
      },
      handleHotUpdate({ file, server }) {
        if (file.endsWith('.jte')) {
          server.ws.send({ type: 'full-reload', path: '*' });
          return [];
        }
      },
    },
  ],
  server: {
    port: 8081,
    strictPort: true,
    proxy: {
      // Vite handles source modules and its client; Spring Boot handles pages and endpoints.
      '^/(?!@|js/|css/|static/js/|node_modules/)': {
        target: 'http://localhost:8080',
        headers: { 'X-Devserver': '1' },
      },
    },
  },
  build: {
    outDir: resolve(projectDir, 'target/classes/static'),
    // Maven also copies static resources here; retain those files.
    emptyOutDir: false,
    cssCodeSplit: false,
    rolldownOptions: {
      input: {
        bundle: resolve(resourcesDir, 'js/app.js'),
        'admin-dashboard': resolve(resourcesDir, 'js/admin-dashboard.js'),
      },
      output: {
        entryFileNames: 'js/[name].js',
        chunkFileNames: 'js/[name]-[hash].js',
        assetFileNames: (asset) =>
          asset.names.some((name) => name.endsWith('.css')) ? 'css/bundle.css' : 'assets/[name]-[hash][extname]',
      },
    },
  },
});
