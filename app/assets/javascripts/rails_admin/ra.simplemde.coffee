#= require 'simplemde/simplemde.min'

$(document).on "rails_admin.dom_ready", ->
  $('.form-group.simplemde_type textarea[data-simplemde]').each ->
    unless $(this).data('rails_admin_simplemde')
      $(this).data('rails_admin_simplemde', new SimpleMDE({ element: this }))
