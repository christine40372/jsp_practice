  var num = 0;
  $('#exampleInputAmount').val(num);

  function add() {
    if (num >= 99) {
      alert('最多可新增99個');
      return;
    }
    num++;
    console.log(num);
    $('#exampleInputAmount').val(num);
  }

  function minus() {
    if (num <= 1) {
      alert('請最少新增一個');
      return;
    }
    num--;
    console.log(num);
    $('#exampleInputAmount').val(num);
  }