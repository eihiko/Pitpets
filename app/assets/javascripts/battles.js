$(function() {
  $(".battle-item").draggable({
    revert: true,
    start: function(ev, ui){
      $(this).draggable("option", "revertDuration", 500);
    }});
  $(".contender").droppable({
    drop: function(ev, ui){
      if(ev.target.id == "me"){
        if($("#offensive").val() == ui.draggable.attr("id")){
          reset_offensive();
        }
        if($("#defensive").val() != ""){
          reset_defensive();
        }
        $("#defensive").val(ui.draggable.attr("id"));
        ui.helper.addClass("defensive");
      }
      else if(ev.target.id == "them"){
        if($("#defensive").val() == ui.draggable.attr("id")){
          reset_defensive();
        }
        if($("#offensive").val() != ""){
          reset_offensive();
        }
        $("#offensive").val(ui.draggable.attr("id"));
        ui.helper.addClass("offensive");
      }
      ui.draggable.draggable("option", "revertDuration", 10);
      update_ui();
    }
  });
});

function reset_offensive(){
  $("#offensive").val("");
  $(".battle-item").removeClass("offensive");
  update_ui();
}

function reset_defensive(){
  $("#defensive").val("");
  $(".battle-item").removeClass("defensive");
  update_ui();
}

function update_ui(){
  off = $("#offensive").val();
  def = $("#defensive").val();

  $("#reset").prop("disabled", false);

  if(off != "" && def != ""){
    $("#attack").prop("disabled", false);
    return;
  }

  $("#attack").prop("disabled", true);

  if(off == "" && def == ""){
    $("#reset").prop("disabled", true);
    return;
  }
}

function reset_battle_items(ev){
  reset_offensive();
  reset_defensive();
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
