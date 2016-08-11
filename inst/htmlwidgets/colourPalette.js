HTMLWidgets.widget({

  name: "colourPalette",

  type: "output",

  factory: function(el, width, height) {

    // append an input element _inside_ the htmlwidget div
    var input = document.createElement("input");
    input.id = el.id + "-input";
    input.class = "form-control my-cp";
    el.appendChild(input);
    // select the input so we can modify in renderValue()
    var $el = $("#" + input.id);

    return {
      renderValue: function(x) {

        // data should contain colourpicker settings
        $el.colourpicker(x);
        $el.colourpicker("value", x.value);

        $el.on("change", function() {
          var grp = crosstalk.group(x.set);
          grp.var("selectionPalette").set($el.colourpicker("value"))
        });

      },

      resize: function(width, height) {

      }
    };
  }
});