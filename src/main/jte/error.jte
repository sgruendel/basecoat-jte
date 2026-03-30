@param Integer status
@param String error


@template.layouts.layout(title = "Error", description = "Error", content=@`
    <h1 class="grow text-3xl md:text-4xl font-medium mb-8">${status} - ${error}</h1>
`)
