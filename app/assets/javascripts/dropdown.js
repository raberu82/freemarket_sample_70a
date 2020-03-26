$(function() {
  $("ul.header__box__nav__listleft li").hover(
    function() {
      $(".sub:not(:animated)", this).slideDown();
    },
    function() {
      $("ul.sub", this).slideUp();
    }
  );
});