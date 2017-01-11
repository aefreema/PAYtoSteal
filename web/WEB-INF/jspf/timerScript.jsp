<span id="countdown" class="timer"></span>
<script>
var seconds = 60*60*24;//60seconds * 60minutes *24 hours

function secondPassed() {
    var minutes = Math.round((seconds - 30)/60);
    var hours = Math.round((minutes - 30)/60);
    var remainingSeconds = seconds % 60;
    var remainingMinutes = minutes % 60;
    if (remainingSeconds < 10) {
        remainingSeconds = "0" + remainingSeconds; 
    }
    document.getElementById('countdown').innerHTML = hours + ":" + remainingMinutes + ":" + remainingSeconds;
    if (seconds == 0) {
        clearInterval(countdownTimer);
        document.getElementById('countdown').innerHTML = "Deal has ended!";
    } else {
        seconds--;
    }
}
var countdownTimer = setInterval('secondPassed()', 1000);
</script>
