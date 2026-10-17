@import static com.basecoatui.jte.util.JteContext.isDevserver

@if(isDevserver())
  <script type="module" src="/@vite/client"></script>
  <script type="module" src="/js/app.js"></script>
@else
  <link href="/css/bundle.css" rel="stylesheet" />
  <script type="module" src="/js/bundle.js"></script>
@endif
