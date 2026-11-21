<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Pickleball Club Sign-Up</title>
<style>
:root{--bg:#4E7D4B;--card:#FFF8E7;--text:#14213d;--muted:#5b6482;--accent:#4169E1;--accent-text:#fff;--ink:#2a4fc0;--border:#e6d9b5;--wait:#F5E3B0;--wait-text:#3d3000;--slot:#ffffff;
box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){color-scheme:dark;--bg:#0c1633;--card:#14224a;--text:#fdf3d8;--muted:#aab6d8;--accent:#5b82f0;--accent-text:#fff;--ink:#a9bdf5;--border:#2a3c78;--wait:#4169E1;--wait-text:#fff;--slot:#1c2d63}}
:root[data-theme="dark"]{color-scheme:dark;--bg:#0c1633;--card:#14224a;--text:#fdf3d8;--muted:#aab6d8;--accent:#5b82f0;--accent-text:#fff;--ink:#a9bdf5;--border:#2a3c78;--wait:#4169E1;--wait-text:#fff;--slot:#1c2d63}
html{scroll-padding-top:env(safe-area-inset-top,0px)}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--text);font-family:system-ui,-apple-system,"Segoe UI",Roboto,sans-serif;line-height:1.5}
main{max-width:760px;margin:0 auto;padding:20px 16px 48px}
h1{font-size:1.9rem;margin:8px 0 4px}
h2{font-size:1.15rem;margin:0 0 12px}
p.sub{color:var(--muted);margin:0 0 20px}
.card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px;margin-bottom:18px}
label{display:block;font-weight:600;font-size:.9rem;margin:12px 0 4px}
input{width:100%;padding:11px 12px;border:1px solid var(--border);border-radius:10px;font-size:1rem;background:#ffffff;color:#14213d}
input:focus{outline:2px solid var(--accent);outline-offset:1px}
button{cursor:pointer;border:0;border-radius:10px;padding:11px 18px;font-size:1rem;font-weight:600;background:var(--accent);color:var(--accent-text)}
button:disabled{opacity:.5;cursor:not-allowed}
.err{color:#c62828;font-size:.85rem;min-height:1.1em;margin-top:2px}
@media (prefers-color-scheme:dark){.err{color:#ff8a80}}
.row{display:flex;gap:8px}
.row input{flex:1}
.counts{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:14px;font-size:.9rem}
.pill{padding:4px 12px;border-radius:999px;background:var(--slot);border:1px solid var(--border)}
.pill.w{background:var(--wait);color:var(--wait-text);border-color:var(--wait)}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(210px,1fr));gap:8px}
.slot{display:flex;align-items:center;gap:6px;padding:8px 10px;border-radius:10px;background:var(--slot);border:1px solid var(--border);min-height:40px;font-size:.95rem}
.slot .n{color:var(--muted);font-size:.8rem;min-width:22px}
.slot .nm{flex:1;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.slot.empty .nm{color:var(--muted)}
.slot.mine{border-color:var(--accent);border-width:2px}
.slot.wait{background:var(--wait);border-color:var(--wait);color:var(--wait-text)}
.slot.wait .n{color:var(--wait-text)}
.slot button{padding:2px 8px;font-size:.85rem;background:transparent;color:inherit;border:1px solid currentColor;border-radius:8px}
.slot input{padding:4px 8px;font-size:.9rem;min-width:0}
.who{display:flex;justify-content:space-between;align-items:center;gap:8px;flex-wrap:wrap;font-size:.9rem;color:var(--muted);margin-bottom:12px}
.who button{background:transparent;color:var(--ink);border:1px solid var(--ink);padding:4px 12px;font-size:.85rem}
.msg{margin-top:8px;font-size:.9rem;min-height:1.2em}
.hide{display:none}
main>h1,main>p.sub{color:#FFF8E7}
.cal{display:grid;grid-template-columns:repeat(7,1fr);gap:6px}
.dow{text-align:center;font-size:.75rem;color:var(--muted);font-weight:600}
.day{aspect-ratio:1/1.05;min-height:58px;border-radius:10px;border:1px solid var(--border);background:var(--slot);color:var(--text);padding:4px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:2px;font-weight:600;font-size:1rem}
.day small{font-size:.62rem;font-weight:500;color:var(--muted)}
.day.full{background:var(--wait);border-color:var(--wait);color:var(--wait-text)}
.day.full small{color:var(--wait-text)}
.day.blank{visibility:hidden}
.day:disabled{opacity:.4}
.day.sel{outline:3px solid var(--accent)}
.time{display:inline-block;margin:0 0 12px;padding:4px 12px;border-radius:999px;background:var(--accent);color:var(--accent-text);font-weight:600;font-size:.85rem}
.back{background:transparent;color:var(--ink);border:1px solid var(--ink);padding:4px 12px;font-size:.85rem}
</style>
</head>
<body>
<main>
<h1>🏓 SEVPC</h1>
<p class="sub">HI PLAYERS! READY TO PLAY? SIGN-UP FIRST.
</p>

<section id="signup" class="card">
<h2>Step 1: Sign up</h2>
<label for="f-name">Full name</label>
<input id="f-name" autocomplete="name" placeholder="Juan Dela Cruz">
<div class="err" id="e-name"></div>
<label for="f-addr">Address</label>
<input id="f-addr" autocomplete="street-address" placeholder="Street, Barangay, City">
<div class="err" id="e-addr"></div>
<label for="f-phone">Phone number</label>
<input id="f-phone" type="tel" autocomplete="tel" placeholder="0917 123 4567">
<div class="err" id="e-phone"></div>
<label for="f-mail">Gmail</label>
<input id="f-mail" type="email" autocomplete="email" placeholder="yourname@gmail.com">
<div class="err" id="e-mail"></div>
<div style="margin-top:14px"><button id="btn-sign">Sign up</button></div>
</section>

<section id="calsec" class="card hide">
<h2>Step 2: Pick a date</h2>
<div class="who"><span id="who"></span><button id="btn-out">Sign out</button></div>
<span class="time">🕕 Every session: 6:00 PM – 10:00 PM</span>
<h2 id="monthname"></h2>
<div class="cal" id="cal"></div>
<p class="sub" style="margin:12px 0 0;font-size:.85rem">Dates in <span style="background:var(--wait);color:var(--wait-text);padding:0 6px;border-radius:6px">cream-gold</span> have all 30 spots taken (waiting list may still be open).</p>
</section>

<section id="reserve" class="card hide">
<div class="who"><button class="back" id="btn-back">← Back to calendar</button></div>
<h2 id="r-title">Step 3: Reserve a spot</h2>
<span class="time">🕕 6:00 PM – 10:00 PM</span>
<div class="row">
<input id="r-name" maxlength="40" placeholder="Type a name to reserve">
<button id="btn-res">Reserve</button>
</div>
<div class="msg" id="msg"></div>
<div class="counts" style="margin-top:14px">
<span class="pill" id="c-mine"></span><span class="pill" id="c-main"></span><span class="pill w" id="c-wait"></span>
</div>
<h2>Players (30)</h2>
<div class="grid" id="main"></div>
<h2 style="margin-top:20px">Waiting list (5)</h2>
<div class="grid" id="wait"></div>
</section>
</main>
<script>
var MAIN=30, WAIT=5, MAXPER=2; // MAXPER = max reservations per account per date
var YEAR=2027, MONTH=0; // January 2027
var user=null, slots={}, date=null, editing=-1;
function load(k,d){try{var v=localStorage.getItem(k);return v?JSON.parse(v):d}catch(e){return d}}
function save(k,v){try{localStorage.setItem(k,JSON.stringify(v))}catch(e){}}
var $=function(id){return document.getElementById(id)};
user=load('pb_user',null); slots=load('pb_slots',{});
// migrate old entries (plain strings) to {name, owner}
Object.keys(slots).forEach(function(k){slots[k]=slots[k].map(function(x){return typeof x==='string'?{name:x,owner:null}:x})});
function key(d){return YEAR+'-01-'+(d<10?'0':'')+d}
function cur(){return slots[date]||(slots[date]=[])}
function setErr(id,t){$(id).textContent=t||''}
function norm(s){return s.trim().replace(/\s+/g,' ').toLowerCase()}
function mine(x){return !!user&&x.owner===user.gmail}
function myCount(){return cur().filter(mine).length}
function nameTaken(v,skip){return cur().some(function(x,i){return i!==skip&&norm(x.name)===norm(v)})}

$('btn-sign').onclick=function(){
  var n=$('f-name').value.trim(),a=$('f-addr').value.trim(),p=$('f-phone').value.trim(),m=$('f-mail').value.trim().toLowerCase();
  var ok=true;
  setErr('e-name',n.length<2?(ok=false,'Please enter your name.'):'');
  setErr('e-addr',a.length<5?(ok=false,'Please enter your address.'):'');
  var digits=p.replace(/\D/g,'');
  setErr('e-phone',(digits.length<7||digits.length>15||/[^\d\s+()-]/.test(p))?(ok=false,'Enter a valid phone number.'):'');
  setErr('e-mail',!/^[a-z0-9._%+-]+@gmail\.com$/.test(m)?(ok=false,'Enter a valid @gmail.com address.'):'');
  if(!ok)return;
  user={name:n,address:a,phone:p,gmail:m};
  save('pb_user',user); date=null; editing=-1; show();
};
$('btn-out').onclick=function(){user=null;date=null;editing=-1;save('pb_user',null);show()};
$('btn-back').onclick=function(){date=null;editing=-1;show()};

function msg(t,bad){var e=$('msg');e.textContent=t;e.style.color=bad?'#c62828':'var(--ink)'}
$('btn-res').onclick=reserve;
$('r-name').onkeydown=function(e){if(e.key==='Enter')reserve()};
function reserve(){
  var list=cur(), v=$('r-name').value.trim().replace(/\s+/g,' ');
  if(!v){msg('Please type a name.',true);return}
  if(myCount()>=MAXPER){msg('Limit reached: each account can reserve only '+MAXPER+' slots per date. Remove one to add another.',true);return}
  if(nameTaken(v,-1)){msg('The name “'+v+'” is already on this date’s list. Names must be unique.',true);return}
  if(list.length>=MAIN+WAIT){msg('Sorry, all 30 spots and the 5-person waiting list are full for this date.',true);return}
  list.push({name:v,owner:user.gmail}); save('pb_slots',slots);
  $('r-name').value='';
  msg(list.length<=MAIN?'Reserved! '+v+' is player #'+list.length+'.':'Session is full. '+v+' is on the waiting list (#'+(list.length-MAIN)+').',false);
  render();
}
function remove(i){
  var x=cur()[i]; if(!x||!mine(x)){msg('You can only remove spots you reserved.',true);return}
  cur().splice(i,1); editing=-1; save('pb_slots',slots); msg('Spot cancelled. Waiting list moved up.',false); render();
}
function startEdit(i){editing=i;render()}
function saveEdit(i,v){
  var x=cur()[i]; if(!x||!mine(x)){msg('You can only edit spots you reserved.',true);return}
  v=v.trim().replace(/\s+/g,' ');
  if(!v){msg('Please type a name.',true);return}
  if(nameTaken(v,i)){msg('The name “'+v+'” is already on this date’s list. Names must be unique.',true);return}
  x.name=v; editing=-1; save('pb_slots',slots); msg('Name updated.',false); render();
}
function btn(txt,title,fn){var b=document.createElement('button');b.textContent=txt;b.title=title;b.setAttribute('aria-label',title);b.onclick=fn;return b}
function cell(i,cls,label){
  var list=cur(), has=i<list.length, x=has?list[i]:null, own=has&&mine(x);
  var d=document.createElement('div');
  d.className='slot '+cls+(has?'':' empty')+(own?' mine':'');
  d.innerHTML='<span class="n"></span><span class="nm"></span>';
  d.firstChild.textContent=label;
  var nm=d.children[1];
  if(own&&editing===i){
    var inp=document.createElement('input');inp.value=x.name;inp.maxLength=40;
    inp.onkeydown=function(e){if(e.key==='Enter')saveEdit(i,inp.value);if(e.key==='Escape'){editing=-1;render()}};
    nm.textContent='';nm.style.overflow='visible';nm.appendChild(inp);
    d.appendChild(btn('\u2713','Save',function(){saveEdit(i,inp.value)}));
    d.appendChild(btn('\u21A9','Cancel edit',function(){editing=-1;render()}));
    setTimeout(function(){inp.focus()},0);
  }else{
    nm.textContent=has?x.name:'Open';
    if(own){
      d.appendChild(btn('\u270E','Edit '+x.name,function(){startEdit(i)}));
      d.appendChild(btn('\u2715','Remove '+x.name,function(){remove(i)}));
    }
  }
  return d;
}
function render(){
  var list=cur(),m=$('main'),w=$('wait');m.innerHTML='';w.innerHTML='';
  for(var i=0;i<MAIN;i++)m.appendChild(cell(i,'',i+1));
  for(var j=0;j<WAIT;j++)w.appendChild(cell(MAIN+j,'wait','W'+(j+1)));
  $('c-mine').textContent='Your slots: '+myCount()+' / '+MAXPER;
  $('c-main').textContent=Math.min(list.length,MAIN)+' / '+MAIN+' reserved';
  $('c-wait').textContent=Math.max(0,list.length-MAIN)+' / '+WAIT+' waiting';
}
function nice(){return new Date(YEAR,MONTH,+date.slice(-2)).toLocaleDateString('en-US',{weekday:'long',month:'long',day:'numeric',year:'numeric'})}
function buildCal(){
  var c=$('cal');c.innerHTML='';
  $('monthname').textContent='January '+YEAR;
  ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'].forEach(function(n){var d=document.createElement('div');d.className='dow';d.textContent=n;c.appendChild(d)});
  var first=new Date(YEAR,MONTH,1).getDay(), days=new Date(YEAR,MONTH+1,0).getDate(), today=new Date();today.setHours(0,0,0,0);
  for(var b=0;b<first;b++){var e=document.createElement('div');e.className='day blank';c.appendChild(e)}
  for(var d=1;d<=days;d++){(function(d){
    var k=key(d),n=(slots[k]||[]).length,btn=document.createElement('button');
    btn.className='day'+(n>=MAIN?' full':'');
    btn.innerHTML='<span>'+d+'</span><small>'+(n>=MAIN?'Full':Math.min(n,MAIN)+'/'+MAIN)+'</small>';
    btn.setAttribute('aria-label','January '+d+', '+n+' of 30 reserved');
    if(new Date(YEAR,MONTH,d)<today)btn.disabled=true;
    btn.onclick=function(){date=k;editing=-1;show()};
    c.appendChild(btn);
  })(d)}
}
function show(){
  $('signup').classList.toggle('hide',!!user);
  $('calsec').classList.toggle('hide',!user||!!date);
  $('reserve').classList.toggle('hide',!user||!date);
  if(user)$('who').textContent='Signed in as '+user.name+' ('+user.gmail+')';
  if(user&&!date)buildCal();
  if(user&&date){$('r-title').textContent='Step 3: Reserve a spot on '+nice();msg('',false);render()}
}
show();
</script>
</body>
</html>
