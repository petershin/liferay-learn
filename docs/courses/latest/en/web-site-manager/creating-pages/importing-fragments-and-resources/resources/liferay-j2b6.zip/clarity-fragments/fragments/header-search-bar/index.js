const openSearchIcon = document.getElementById('js-open-search');
const closeSearchIcon = document.getElementById('js-close-search');
const searchBar = document.getElementById('clarity-search-bar');

//add an event listener for a click event on the search icon 
openSearchIcon.addEventListener("click", function(){
    closeSearchIcon.style.display = "block";
    openSearchIcon.style.display = "none";
    searchBar.style.display = "block";
});

//listen to the whole document for a click event off of the search bar 
closeSearchIcon.addEventListener("click", function(){
    closeSearchIcon.style.display = "none";
    openSearchIcon.style.display = "block";
    searchBar.style.display = "none";
});
