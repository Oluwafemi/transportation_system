#= require active_admin/base

//= require autocomplete-rails

//= require chosen.jquery.min

$(document).ready(function(){
  $(".chzn-select").chosen({no_results_text: "<%= I18n.t(:no_results_text, :scope => :chozen) %>"});
})
