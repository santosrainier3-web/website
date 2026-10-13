<!DOCTYPE html>
<html lang="en">  
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Play Zone – Open Play, Halloween Party & Tournament</title>
<style>
/* ---- NEW: clickable date slots ---- */
.slots{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:20px;
margin:28px 0;
  }
.slot{
background:#1c1535;
border:2px solid #7c4dff;
border-radius:20px;
padding:28px 20px;
color:#fff;
font-family:inherit;
text-align:center;
cursor:pointer;
transition:transform .15s, border-color .15s, background .15s;
  }
.slot:hover,.slot:focus-visible{
transform:translateY(-3px);
border-color:#ee8236;
background:#241a45;
outline:none;
  }
.slot .date{display:block;font-size:24px;font-weight:800;color:#ee8236;}
.slot .time{display:block;font-size:20px;font-weight:700;margin-top:8px;}
@media (max-width:600px){ .slots{grid-template-columns:1fr;} }
/* ---- NEW: small dropdown for number of people ---- */
.small-box{
width:110px;
padding:10px 12px;
background:#0f0b1f;
color:#fff;
border:1px solid #2a2150;
border-radius:10px;
font-size:16px;
  }
/* ---- NEW: numbered slot list (1-30) shown after Submit ---- */
.slotlist{
display:grid;
grid-template-rows:repeat(10,auto);
grid-auto-flow:column;
grid-template-columns:repeat(3,1fr);
gap:10px 28px;
margin:24px 0 28px;
  }
.slotitem{
display:flex;
gap:10px;
align-items:baseline;
padding:10px 14px;
background:#1c1535;
border:1px solid #2a2150;
border-radius:12px;
min-height:44px;
color:#fff;
font-weight:700;
  }
.slotitem .no{color:#ee8236;min-width:30px;}
.slotitem.empty{color:#6f6590;font-weight:400;}
.slotitem .nm{overflow-wrap:anywhere;}
/* ---- REMOVABLE: clickable name style ---- */
.slotitem .nm.filled{
cursor:pointer;
transition:opacity .15s;
}
.slotitem .nm.filled:hover{
opacity:0.6;
text-decoration:line-through;
}
@media (max-width:700px){
.slotlist{grid-auto-flow:row;grid-template-rows:none;grid-template-columns:1fr;}
  }
/* ---- NEW: selected schedule line in the form ---- */
#slotRow{display:none;}
#slotRow .chosen{
padding:12px 14px;
background:#0f0b1f;
border:1px solid #2a2150;
border-radius:10px;
color:#ee8236;
font-weight:700;
  }
/* base page styles (added for completeness) */
body{font-family:system-ui,-apple-system,sans-serif;background:#0f0b1f;color:#fff;margin:0;line-height:1.5;}
header{display:flex;justify-content:space-between;align-items:center;padding:16px 24px;background:#1c1535;border-bottom:2px solid #7c4dff;}
.logo{font-size:24px;font-weight:800;cursor:pointer;}
.logo span{color:#ee8236;}
nav a{color:#fff;margin:0 12px;text-decoration:none;cursor:pointer;}
nav a:hover{color:#ee8236;}
main,section{padding:24px;max-width:1000px;margin:0 auto;}
.page{display:none;}
.page.active{display:block;}
h1{color:#ee8236;}
.lead{font-size:18px;color:#b0a4d6;}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:20px;margin:24px 0;}
.box{background:#1c1535;border:1px solid #2a2150;border-radius:12px;padding:20px;}
.box h3{margin-top:0;color:#7c4dff;}
ul{padding-left:20px;}
li{margin:8px 0;}
label{display:block;margin:16px 0 4px;font-weight:600;}
input,select,textarea{width:100%;padding:10px 12px;background:#1c1535;border:1px solid #2a2150;border-radius:8px;color:#fff;font-size:16px;box-sizing:border-box;}
button{cursor:pointer;font-size:16px;font-weight:700;}
.btn{background:#ee8236;color:#000;border:none;border-radius:10px;padding:12px 24px;margin:8px 4px;}
.btn.alt{background:transparent;color:#ee8236;border:2px solid #ee8236;}
.cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:24px;margin-top:32px;}
.card{background:#1c1535;border:2px solid #7c4dff;border-radius:16px;padding:24px;cursor:pointer;transition:transform .2s;}
.card:hover{transform:translateY(-4px);border-color:#ee8236;}
.card .icon{font-size:40px;}
.card h2{margin:12px 0 8px;}
footer{text-align:center;padding:24px;color:#6f6590;font-size:14px;border-top:1px solid #2a2150;margin-top:32px;}
</style>
</head>
<body>
<header>
<div class="logo" onclick="show('home')">SEV<span>PICKLEBALL</span></div>
<nav>
<a onclick="show('home')">Home</a>
<a onclick="show('open')">Open Play</a>
<a onclick="show('halloween')">Halloween</a>
<a onclick="show('tournament')">Tournament</a>
</nav>
</header>
<!-- HOME: choose a category -->
<main id="home" class="page active" style="max-width:none;padding:0">
<section class="hero">
<h1>Welcome to <span>Sta.Elena Pickleball!</span></h1>
<p>Choose what you'd like to join today.</p>
</section>
<section class="cards">
<div class="card" onclick="show('open')">
<div class="icon">🏓</div><h2>Open Play</h2>
<p>Chill Play, Practice, and chismis for fun!,  No walk in, Book a schedule now!</p>
<button class="btn">Choose</button>
</div>
<div class="card" onclick="show('halloween')">
<div class="icon">🎃</div><h2>Halloween Party</h2>
<p>Costumes, games, treats and spooky surprises for everyone.</p>
<button class="btn">Choose</button>
</div>
<div class="card" onclick="show('tournament')">
<div class="icon">🏆</div><h2>Tournament</h2>
<p>Compete, win prizes and become the champion.</p>
<button class="btn">Choose</button>
</div>
</section>
</main>
<!-- OPEN PLAY -->
<section id="open" class="page">
<h1>🏓 Open Play</h1>
<p class="lead">Drop in anytime during open hours. No team needed.</p>
<div class="grid">
<div class="box"><h3>Schedule</h3><ul><li>Mon–Fri: 12:00 PM – 3:00 PM</li><li>Sat–Sun: 6:00 PM – 10:00 PM</li></ul></div>
<div class="box"><h3>Rates</h3><ul><li>Day Rate: ₱50</li><li>Night Rate: ₱100</li></ul></div>
<div class="box"><h3>Good to know</h3><ul><li>No walk-ins</li><li>Beginner Friendly</li><li>Free Water Refill</li><li>Bring your own paddle</li></ul></div>
</div>
<button class="btn" onclick="show('slots')">Reserve a Slot</button>
<button class="btn alt" onclick="show('home')">← Back</button>
</section>
<!-- NEW: OPEN PLAY DATE SLOTS (clickable) -->
<section id="slots" class="page">
<h1>Pick a date</h1>
<p class="lead">Tap a schedule to reserve your slot.</p>
<div class="slots">
<button type="button" class="slot" onclick="pickSlot('10-15-2026','12pm - 3pm')">
<span class="date">10-15-2026</span><span class="time">12pm - 3pm</span>
</button>
<button type="button" class="slot" onclick="pickSlot('10-16-2026','6pm - 10pm')">
<span class="date">10-16-2026</span><span class="time">6pm - 10pm</span>
</button>
<button type="button" class="slot" onclick="pickSlot('10-17-2026','12pm - 3pm')">
<span class="date">10-17-2026</span><span class="time">12pm - 3pm</span>
</button>
<button type="button" class="slot" onclick="pickSlot('10-18-2026','6pm - 10pm')">
<span class="date">10-18-2026</span><span class="time">6pm - 10pm</span>
</button>
</div>
<button class="btn alt" onclick="show('open')">← Back</button>
</section>
<!-- HALLOWEEN -->
<section id="halloween" class="page">
<h1>🎃 Halloween Party</h1>
<p class="lead">Come in costume and enjoy a night of fun, games and prizes.</p>
<div class="grid">
<div class="box"><h3>Date & Time</h3><ul><li>October 31</li><li>6:00 PM – 11:00 PM</li></ul></div>
<div class="box"><h3>What's included</h3><ul><li>Costume contest</li><li>Trick-or-treat station</li><li>Music & games</li><li>Photo booth</li></ul></div>
<div class="box"><h3>Entry</h3><ul><li>₱300 per person</li><li>Kids in costume: ₱200</li></ul></div>
</div>
<button class="btn" onclick="goForm('Halloween Party')">Join the Party</button>
<button class="btn alt" onclick="show('home')">← Back</button>
</section>
<!-- TOURNAMENT -->
<section id="tournament" class="page">
<h1>🏆 Tournament</h1>
<p class="lead">Register your team and compete for the championship.</p>
<div class="grid">
<div class="box"><h3>Details</h3><ul><li>Date: November 15</li><li>Format: Single elimination</li><li>Teams: 16 max</li></ul></div>
<div class="box"><h3>Prizes</h3><ul><li>1st: ₱10,000 + trophy</li><li>2nd: ₱5,000</li><li>3rd: ₱2,000</li></ul></div>
<div class="box"><h3>Registration</h3><ul><li>₱1,500 per team</li><li>Deadline: November 8</li></ul></div>
</div>
<button class="btn" onclick="goForm('Tournament')">Register Now</button>
<button class="btn alt" onclick="show('home')">← Back</button>
</section>
<!-- BOOKING FORM -->
<section id="form" class="page">
<h1>Sign Up</h1>
<p class="lead">Fill in your details and we'll confirm with you.</p>
<form onsubmit="return send(event)">
<div><label>Category</label>
<select id="cat"><option>Open Play</option><option>Halloween Party</option><option>Tournament</option></select></div>
<!-- NEW: shows the date you picked (Open Play only) -->
<div id="slotRow"><label>Selected schedule</label>
<div class="chosen" id="slotText"></div></div>
<div><label>Name</label><input id="name" required></div>
<div><label>Email</label><input id="contact" required></div>
<!-- CHANGED: small dropdown, 1 to 30 -->
<div><label for="pax">Number of people</label>
<select id="pax" class="small-box" required></select></div>
<div><label>Message (optional)</label><textarea id="msg" rows="3"></textarea></div>
<button class="btn" type="submit">Submit</button>
<button class="btn alt" type="button" style="margin-top:12px;width:100%" onclick="checkSlots()">Check the slot first</button>
</form>
<button class="btn alt" style="margin-top:18px" onclick="goBack()">← Back</button>
</section>
<!-- NEW: SLOT LIST (shown after Submit) -->
<section id="slotpage" class="page">
<h1>Slot:</h1>
<p class="lead" id="slotTitle"></p>
<div class="slotlist" id="slotList"></div>
<button class="btn alt" onclick="show(slotBackTo)">← Back</button>
</section>
<footer>© 2026 Pickleball · Sta.Elena, Antipolo City · Contact: santosrainier3@gmail.com · +6394 5773 8545</footer>
<script>
function show(id){
document.querySelectorAll('.page').forEach(p=>p.classList.remove('active'));
document.getElementById(id).classList.add('active');
window.scrollTo(0,0);
  }
// Fill the "Number of people" dropdown with 1 to 30
var paxSelect=document.getElementById('pax');
for(var i=1;i<=30;i++){ paxSelect.add(new Option(i,i)); }
// Selected Open Play schedule (empty for Halloween / Tournament)
var chosenSlot="";
function pickSlot(date,time){
chosenSlot=date+"  |  "+time;
document.getElementById('slotText').textContent=date+" · "+time;
document.getElementById('slotRow').style.display="block";
document.getElementById('cat').value="Open Play";
show('form');
  }
function goForm(cat){
chosenSlot="";
document.getElementById('slotRow').style.display="none";
document.getElementById('cat').value=cat;
show('form');
  }
// Back button on the form: Open Play goes back to the date slots
function goBack(){
show(chosenSlot ? 'slots' : 'home');
  }
// ---- Numbered slots (1-30), saved in this browser ----
var MAX_SLOTS=30;
function listKey(cat,slot){ return "slots::"+cat+"::"+(slot||"general"); }
function loadList(key){
var arr=[];
try{ arr=JSON.parse(localStorage.getItem(key)||"[]"); }catch(err){}
while(arr.length<MAX_SLOTS) arr.push("");
return arr.slice(0,MAX_SLOTS);
  }
function saveList(key,arr){
try{ localStorage.setItem(key,JSON.stringify(arr)); }catch(err){}
  }
// ---- REMOVE A SINGLE SLOT ----
function removeSlot(index){
var cat=document.getElementById('cat').value;
var slot=cat==='Open Play' ? chosenSlot : "";
var key=listKey(cat,slot);
var arr=loadList(key);
if(arr[index]){
if(confirm('Remove "'+arr[index]+'" from slot '+(index+1)+'?')){
arr[index]="";
saveList(key,arr);
renderSlots(cat,slot);
      }
    }
  }
function renderSlots(cat,slot){
var arr=loadList(listKey(cat,slot));
document.getElementById('slotTitle').textContent=cat+(slot?" · "+slot.replace("  |  "," · "):"");
var html="";
for(var i=0;i<MAX_SLOTS;i++){
var name=arr[i];
if(name){
html+='<div class="slotitem"><span class="no">'+(i+1)+'.</span>'+
'<span class="nm filled" onclick="removeSlot('+i+')" title="Click to remove">'+
name.replace(/&/g,"&amp;").replace(/</g,"&lt;")+'</span></div>';
      }else{
html+='<div class="slotitem empty"><span class="no">'+(i+1)+'.</span>'+
'<span class="nm">—</span></div>';
      }
    }
document.getElementById('slotList').innerHTML=html;
show('slotpage');
  }
// Which schedule applies right now (only Open Play uses a date slot)
var slotBackTo='home';
function currentSlot(){
return document.getElementById('cat').value==='Open Play' ? chosenSlot : "";
  }
// Hide/show the "Selected schedule" line when the category changes
document.getElementById('cat').addEventListener('change',function(){
document.getElementById('slotRow').style.display =
      (this.value==='Open Play' && chosenSlot) ? 'block' : 'none';
  });
// "Check the slot first" button: look at the list without signing up
function checkSlots(){
var cat=document.getElementById('cat').value;
if(cat==='Open Play' && !chosenSlot){
alert("Please pick a date first.");
show('slots');
return;
    }
slotBackTo='form';
renderSlots(cat,currentSlot());
  }
function send(e){
e.preventDefault();
var g=function(i){return document.getElementById(i).value};
// Put the full name in the next free number(s)
var cat=g('cat'), full=g('name').trim(), count=parseInt(g('pax'),10)||1;
if(cat==='Open Play' && !chosenSlot){ alert("Please pick a date first."); show('slots'); return false; }
var slot=currentSlot();
var key=listKey(cat,slot), arr=loadList(key);
var free=arr.filter(function(n){return !n;}).length;
if(count>free){
alert(free===0 ? "Sorry, this schedule is already full." :
"Only "+free+" slot(s) left for this schedule. Please lower the number of people.");
return false;
    }
var added=0;
for(var i=0;i<MAX_SLOTS && added<count;i++){
if(!arr[i]){ arr[i]= added===0 ? full : full+" (+"+added+")"; added++; }
    }
saveList(key,arr);
slotBackTo='home';
renderSlots(cat,slot);                // show the numbered list
e.target.reset();                     // clear the form for the next person
document.getElementById('cat').value=cat;
return false;
  }
</script>
</body>
</html>
