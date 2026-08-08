import htmx from 'htmx.org';
import 'css/app.css';
import 'basecoat-css/all';

// keep htmx from settling width/height attributes on swapped elements:
// it strips Chart.js' canvas width/height attributes on settle, wiping the bitmap
htmx.config.attributesToSettle = ['class', 'style'];
