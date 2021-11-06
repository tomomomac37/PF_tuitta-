document.addEventListener('DOMContentLoaded', function() {
    // var modeSwitch = document.querySelector('.mode-switch');
    // modeSwitch.addEventListener('click', function() {
    //     document.documentElement.classList.toggle('dark');
    //     modeSwitch.classList.toggle('active');
    // });

    var listView = document.querySelector('.list-view');
    var gridView = document.querySelector('.grid-view');
    var projectsList = document.querySelector('.project-boxes');
    var listItems = document.getElementsByClassName('project-btn-more');
    
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
    
    // window.addEventListener('load', () => {
    //     const uploader = document.querySelector('.uploader');
    //     uploader.addEventListener('change', (e) => {
    //       const file = uploader.files[0];
    //       const reader = new FileReader();
    //       reader.readAsDataURL(file);
    //       reader.onload = () => {
    //         const image = reader.result;
    //         document.querySelector('.avatar').setAttribute('src', image);
    //       }
    //     });
    // });
 
});
