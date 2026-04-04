<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/toast.njk --%>

@import gg.jte.Content

@param String classAppend = null
@param Content content = null

<div id="toaster" class="toaster ${classAppend}">${content}</div>
