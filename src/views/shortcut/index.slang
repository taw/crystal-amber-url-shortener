.row
  .col-sm-11
    h2 Shortcuts
  .col-sm-1
    a.btn.btn-success.btn-sm href="/shortcuts/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Slug
        th Url
        th Visits
        th Actions
    tbody
      - shortcuts.each do |shortcut|
        tr
          td = shortcut.slug
          td = shortcut.url
          td = shortcut.visits
          td
            span
              == link_to("Show", "/shortcuts/#{shortcut.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/shortcuts/#{shortcut.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/shortcuts/#{ shortcut.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
