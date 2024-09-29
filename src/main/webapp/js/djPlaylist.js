console.clear();

document.querySelector('.checkbox_all');

checkAll.addEventListener('click', function(){

    const isChecked = checkAll.checked;

    if(isChecked){
        const checkboxes = document.querySelectorAll('.checkbox_item');

        for(const checkbox of checkboxes){
            checkbox.checked = true;
        }
    }

    else{
        const checkboxes = document.querySelectorAll('.checkbox_item');
        for(const checkbox of checkboxes){
            checkbox.checked = false;
        }
    }
})
////////////////////////////////////////////////////////////
const checkboxes = document.querySelectorAll('.checkbox_item');
for(const checkbox of checkboxes){
  checkbox.addEventListener('click',function(){
    
    const totalCnt = checkboxes.length;
  
    const checkedCnt = document.querySelectorAll('.checkbox_item:checked').length;
    
    if(totalCnt == checkedCnt){
      document.querySelector('.checkbox_all').checked = true;
    }
    else{
      document.querySelector('.checkbox_all').checked = false;
    }
  });
  
}

// $('.checkbox_all').change(function () {
//     //alert(this.checked);
//     if(this.checked) {
//         $('.checkbox_item:not(:checked)').prop('checked', true);
//     }else {
//         $('.checkbox_item:checked').prop('checked', false);
//     }
// });