window.addEventListener("load", function() {
  console.log("okiii")

const input_date = document.getElementById('date_time');
const button1 = document.getElementById('mainForm');

// input_date.addEventListener('change', updateValue);
button1.addEventListener('click',updateValue);

function updateValue(e) {
  const date_value = input_date.value
  var result = date_value.substr( 11, 2 );
  var result_to_number = Number(result)

  if (result_to_number > 8 && result_to_number < 15) {
  } else {
    alert('出発時間をAM09:00~PM15:00で選択してください')
    e.preventDefault();
  }

}

})