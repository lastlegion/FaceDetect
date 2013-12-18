exports.config =
  # See http://brunch.io/#documentation for docs.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(?!app)/

    stylesheets:
      joinTo: 'stylesheets/app.css'
      order:
          before: ['vendor/styles/normalize.css']
          after: ['vendor/styles/helpers.css']
    templates:
      joinTo: 'javascripts/app.js'
