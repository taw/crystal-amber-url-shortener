h1 Show Shortcut
p = shortcut.slug
p = shortcut.url
p = shortcut.visits
p
  == link_to("Back", "/shortcuts", class: "btn btn-light btn-sm")
  == link_to("Edit", "/shortcuts/#{shortcut.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/shortcuts/#{shortcut.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
