const toggler = document.querySelector(".btn");

toggler.addEventListener('click', function () {
    document.querySelector("#sidebar").classList.toggle("collapsed");
});

$(document).on("click", "#navDj", function(event) {
	$("#main-content").load("/playlist2/dj/djToday.do");
});
