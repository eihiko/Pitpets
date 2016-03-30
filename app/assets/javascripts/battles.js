$(function() {
  $(".battle-item").draggable({
    revert: true,
    start: function(ev, ui){
      $(this).draggable("option", "revertDuration", 500);
    }});
  $(".contender").droppable({
    drop: function(ev, ui){
      if($("#offensive").val() == ""){
        $("#offensive").val(ui.draggable.attr("id"));
        $("#offensive_target").val(ev.target.id);
        $("#reset").prop("disabled", false);
      }
      else{
        $("#defensive").val(ui.draggable.attr("id"));
        $("#defensive_target").val(ev.target.id);
        $(".battle-item").draggable("disable");
        $("#attack").prop("disabled", false);
      }
      ui.draggable.draggable("option", "revertDuration", 10);
      ui.helper.addClass("active");
    }
  });
});

function reset_battle_items(ev){
  $("#offensive").val("");
  $("#defensive").val("");
  $("#offensive_target").val("");
  $("#defensive_target").val("");
  $("#attack").prop("disabled", true);
  $("#reset").prop("disabled", true);
  $(".battle-item").draggable("enable");
  $(".battle-item").removeClass("active");
}

/*function drag_battle_item(ev){
  if(ev.target.class = "battle-item"){
    ev.dataTransfer.setData("item_id", ev.target.id);
  }
}

function allowDrop(ev){
  ev.preventDefault();
}

function drop_battle_item(ev){
  ev.preventDefault();
  var data = ev.dataTransfer.getData("item_id");
  alert("item: " + data + ", target: " + ev.target);
}*/
