- if shortcut.errors
  ul.errors
    - shortcut.errors.each do |error|
      li = error.to_s

== form(action: "/shortcuts/#{shortcut.id.to_s}", method: shortcut.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "slug", value: shortcut.slug, placeholder: "Slug", class: "form-control")
  .form-group
    == text_field(name: "url", value: shortcut.url, placeholder: "Url", class: "form-control")
  .form-group
    == text_field(name: "visits", value: shortcut.visits, placeholder: "Visits", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/shortcuts", class: "btn btn-light btn-sm")
