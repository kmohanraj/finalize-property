jQuery('#phone').keyup(function(){
    this.value = this.value.replace(/[^0-9]/,'');
});