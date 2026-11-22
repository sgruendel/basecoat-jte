@param String pageTitle
@param gg.jte.Content content

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>${pageTitle} - app.title</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />
    @template.layouts.assets()
  </head>
  <body hx-boost="true">
    ${content} @template.basecoat.toaster()
  </body>
</html>
