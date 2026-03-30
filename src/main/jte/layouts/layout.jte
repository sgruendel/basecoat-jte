@import static com.basecoatui.jte.util.JteContext.*

@param String title
@param String description
@param gg.jte.Content content

<%-- TODO {% include "partials/sidebar.njk" %} --%>

@template.layouts.base(title = title, description = description, content = @`
    <main id="content">
        <header class="bg-background sticky inset-x-0 top-0 isolate flex shrink-0 items-center gap-2 border-b z-10">
            <%-- TODO {% include "partials/header.njk" %} --%>
        </header>

        <div class="p-4 md:p-6 xl:p-12">
            ${content}
        </div>
    </main>
`)