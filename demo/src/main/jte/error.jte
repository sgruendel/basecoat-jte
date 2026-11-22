@param Integer status
@param String error

@template.layouts.layout(
  title = "Error",
  description = "Error",
  content=@`<h1 class="mb-8 grow text-3xl font-medium md:text-4xl">${status} - ${error}</h1>`
)
