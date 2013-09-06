var vehicle_type_typeahead_labels
var vehicle_type_typeahead_mapped
var vehicle_owner_typeahead_labels
var vehicle_owner_typeahead_mapped
$(document).ready(function() {
    $('.vehicle-type-typeahead').typeahead({ 
        source: function (query, process) {
            $.getJSON("/admin/vehicle_types/vehicle_type_suggestions", { search: query }, function (data) {
                vehicle_type_typeahead_labels = []
                vehicle_type_typeahead_labels = {}

                $.each(data, function (i, item) {
                    var vehicle_type_name_and_id = item.type_name + " - " + item.id
                    vehicle_type_typeahead_mapped[vehicle_type_name_and_id] = item.id
                    vehicle_type_typeahead_labels.push(vehicle_type_name_and_id)
                })

                process(vehicle_type_typeahead_labels)
            })
        }
        updater: function (item) {
            return vehicle_type_typeahead_mapped[item]
        }
    })

    $('.vehicle-owner-typeahead').typeahead({ 
        source: function (query, process) {
            $.getJSON("/admin/vehicle_owners/vehicle_owner_suggestions", { search: query }, function (data) {
                vehicle_owner_typeahead_labels = []
                vehicle_owner_typeahead_labels = {}

                $.each(data, function (i, item) {
                    var vehicle_owner_full_name_and_id = item.full_name + " - " + item.id
                    vehicle_owner_typeahead_mapped[vehicle_owner_full_name_and_id] = item.id
                    vehicle_owner_typeahead_labels.push(vehicle_owner_full_name_and_id)
                })

                process(vehicle_owner_typeahead_labels)
            })
        }   
        updater: function (item) {
            return vehicle_ownero_typeahead_mapped[item]
        }
    })
});