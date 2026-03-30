@template.layouts.layout(title = "Kitchen Sink", description = "A collection of all the components available in Basecoat.",
content = @`
<div class="flex gap-x-10 justify-center">
    <div>
        <header class="space-y-2 mb-8">
            <h1 class="text-3xl font-semibold tracking-tight">Kitchen Sink</h1>
            <p class="text-muted-foreground">A collection of all the components available in Basecoat.</p>
        </header>
        <div class="grid gap-4 flex-1">
            @template.kitchenSink.accordion()
            <%--
            {% for component in components %}
            {% include "partials/kitchen-sink/" ~ component.id ~ ".njk" %}
            {% endfor %}
            --%>
        </div>
    </div>
    <div class="hidden text-sm xl:block w-full max-w-[200px]">
        <%--
        {% from "macros/toc.njk" import toc_nav %}
        {{ toc_nav(components) }}
        --%>
    </div>
</div>
`)