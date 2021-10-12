// jquary
// $(document).ready( function(){
document.addEventListener('DOMContentLoaded', function() {
    // var modeSwitch = document.querySelector('.mode-switch');

    // modeSwitch.addEventListener('click', function() {
    //     document.documentElement.classList.toggle('dark');
    //     modeSwitch.classList.toggle('active');
    // });

    var listView = document.querySelector('.list-view');
    var gridView = document.querySelector('.grid-view');
    var projectsList = document.querySelector('.project-boxes');

    listView.addEventListener('click', function() {
        gridView.classList.remove('active');
        listView.classList.add('active');
        projectsList.classList.remove('jsGridView');
        projectsList.classList.add('jsListView');
    });

    gridView.addEventListener('click', function() {
        gridView.classList.add('active');
        listView.classList.remove('active');
        projectsList.classList.remove('jsListView');
        projectsList.classList.add('jsGridView');
    });

    // document.querySelector('.messages-btn').addEventListener('click', function() {
    //     document.querySelector('.messages-section').classList.add('show');
    // });

    // document.querySelector('.messages-close').addEventListener('click', function() {
    //     document.querySelector('.messages-section').classList.remove('show');
    // });
    
    // 縦三点リーダクリック時アクション
    // var projectBtnMore = document.querySelector('.project-btn-more');
    // var verticalThreeReader = document.querySelector('.vertical-three-reader');
    
    // projectBtnMore.addEventListener('click', function() {
    //     // projectBtnMore.classList.add('verticalThreeReader');
    //     projectBtnMore.classList.toggle('is-show');
    //     verticalThreeReader.classList.toggle('is-show')
    // })
    
    document.querySelector(".vertical-three-reader").style.visibility ="hidden";

    function verticalThreeReader(){
    	const verticalThreeReader = document.querySelector(".vertical-three-reader");
    
    	if(verticalThreeReader.style.visibility=="visible"){
    		// hiddenで非表示
    		verticalThreeReader.style.visibility ="hidden";
    	}else{
    		// visibleで表示
    		verticalThreeReader.style.visibility ="visible";
    	}
}
    
    
});