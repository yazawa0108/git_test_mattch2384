$(document).on("turbolinks:load", function () {
  $(function () {
    $(".btn-gnavi").on("click", function () {
      let rightVal = 0;
      if ($(this).hasClass("open")) {
        rightVal = -220;
        $(this).removeClass("open");
      } else {
        $(this).addClass("open");
      }

      $("#global-navi").stop().animate(
        {
          right: rightVal,
        },
        200
      );
    });
  });
});
