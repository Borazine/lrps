<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8" />
<meta name="generator" content="pandoc" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />

<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="author" content="H. Li; E. Kawaguchi" />

<meta name="date" content="2024-03-03" />

<title>L(og)R(ank)P(ower)S(ample Size)</title>

<script>// Pandoc 2.9 adds attributes on both header and div. We remove the former (to
// be compatible with the behavior of Pandoc < 2.8).
document.addEventListener('DOMContentLoaded', function(e) {
  var hs = document.querySelectorAll("div.section[class*='level'] > :first-child");
  var i, h, a;
  for (i = 0; i < hs.length; i++) {
    h = hs[i];
    if (!/^h[1-6]$/i.test(h.tagName)) continue;  // it should be a header h1-h6
    a = h.attributes;
    while (a.length > 0) h.removeAttribute(a[0].name);
  }
});
</script>

<style type="text/css">
code{white-space: pre-wrap;}
span.smallcaps{font-variant: small-caps;}
span.underline{text-decoration: underline;}
div.column{display: inline-block; vertical-align: top; width: 50%;}
div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
ul.task-list{list-style: none;}
</style>



<style type="text/css">
code {
white-space: pre;
}
.sourceCode {
overflow: visible;
}
</style>
<style type="text/css" data-origin="pandoc">
pre > code.sourceCode { white-space: pre; position: relative; }
pre > code.sourceCode > span { display: inline-block; line-height: 1.25; }
pre > code.sourceCode > span:empty { height: 1.2em; }
.sourceCode { overflow: visible; }
code.sourceCode > span { color: inherit; text-decoration: inherit; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
pre > code.sourceCode { white-space: pre-wrap; }
pre > code.sourceCode > span { text-indent: -5em; padding-left: 5em; }
}
pre.numberSource code
{ counter-reset: source-line 0; }
pre.numberSource code > span
{ position: relative; left: -4em; counter-increment: source-line; }
pre.numberSource code > span > a:first-child::before
{ content: counter(source-line);
position: relative; left: -1em; text-align: right; vertical-align: baseline;
border: none; display: inline-block;
-webkit-touch-callout: none; -webkit-user-select: none;
-khtml-user-select: none; -moz-user-select: none;
-ms-user-select: none; user-select: none;
padding: 0 4px; width: 4em;
color: #aaaaaa;
}
pre.numberSource { margin-left: 3em; border-left: 1px solid #aaaaaa; padding-left: 4px; }
div.sourceCode
{ }
@media screen {
pre > code.sourceCode > span > a:first-child::before { text-decoration: underline; }
}
code span.al { color: #ff0000; font-weight: bold; } 
code span.an { color: #60a0b0; font-weight: bold; font-style: italic; } 
code span.at { color: #7d9029; } 
code span.bn { color: #40a070; } 
code span.bu { color: #008000; } 
code span.cf { color: #007020; font-weight: bold; } 
code span.ch { color: #4070a0; } 
code span.cn { color: #880000; } 
code span.co { color: #60a0b0; font-style: italic; } 
code span.cv { color: #60a0b0; font-weight: bold; font-style: italic; } 
code span.do { color: #ba2121; font-style: italic; } 
code span.dt { color: #902000; } 
code span.dv { color: #40a070; } 
code span.er { color: #ff0000; font-weight: bold; } 
code span.ex { } 
code span.fl { color: #40a070; } 
code span.fu { color: #06287e; } 
code span.im { color: #008000; font-weight: bold; } 
code span.in { color: #60a0b0; font-weight: bold; font-style: italic; } 
code span.kw { color: #007020; font-weight: bold; } 
code span.op { color: #666666; } 
code span.ot { color: #007020; } 
code span.pp { color: #bc7a00; } 
code span.sc { color: #4070a0; } 
code span.ss { color: #bb6688; } 
code span.st { color: #4070a0; } 
code span.va { color: #19177c; } 
code span.vs { color: #4070a0; } 
code span.wa { color: #60a0b0; font-weight: bold; font-style: italic; } 
</style>
<script>
// apply pandoc div.sourceCode style to pre.sourceCode instead
(function() {
  var sheets = document.styleSheets;
  for (var i = 0; i < sheets.length; i++) {
    if (sheets[i].ownerNode.dataset["origin"] !== "pandoc") continue;
    try { var rules = sheets[i].cssRules; } catch (e) { continue; }
    var j = 0;
    while (j < rules.length) {
      var rule = rules[j];
      // check if there is a div.sourceCode rule
      if (rule.type !== rule.STYLE_RULE || rule.selectorText !== "div.sourceCode") {
        j++;
        continue;
      }
      var style = rule.style.cssText;
      // check if color or background-color is set
      if (rule.style.color === '' && rule.style.backgroundColor === '') {
        j++;
        continue;
      }
      // replace div.sourceCode by a pre.sourceCode rule
      sheets[i].deleteRule(j);
      sheets[i].insertRule('pre.sourceCode{' + style + '}', j);
    }
  }
})();
</script>




<style type="text/css">body {
background-color: #fff;
margin: 1em auto;
max-width: 700px;
overflow: visible;
padding-left: 2em;
padding-right: 2em;
font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
font-size: 14px;
line-height: 1.35;
}
#TOC {
clear: both;
margin: 0 0 10px 10px;
padding: 4px;
width: 400px;
border: 1px solid #CCCCCC;
border-radius: 5px;
background-color: #f6f6f6;
font-size: 13px;
line-height: 1.3;
}
#TOC .toctitle {
font-weight: bold;
font-size: 15px;
margin-left: 5px;
}
#TOC ul {
padding-left: 40px;
margin-left: -1.5em;
margin-top: 5px;
margin-bottom: 5px;
}
#TOC ul ul {
margin-left: -2em;
}
#TOC li {
line-height: 16px;
}
table {
margin: 1em auto;
border-width: 1px;
border-color: #DDDDDD;
border-style: outset;
border-collapse: collapse;
}
table th {
border-width: 2px;
padding: 5px;
border-style: inset;
}
table td {
border-width: 1px;
border-style: inset;
line-height: 18px;
padding: 5px 5px;
}
table, table th, table td {
border-left-style: none;
border-right-style: none;
}
table thead, table tr.even {
background-color: #f7f7f7;
}
p {
margin: 0.5em 0;
}
blockquote {
background-color: #f6f6f6;
padding: 0.25em 0.75em;
}
hr {
border-style: solid;
border: none;
border-top: 1px solid #777;
margin: 28px 0;
}
dl {
margin-left: 0;
}
dl dd {
margin-bottom: 13px;
margin-left: 13px;
}
dl dt {
font-weight: bold;
}
ul {
margin-top: 0;
}
ul li {
list-style: circle outside;
}
ul ul {
margin-bottom: 0;
}
pre, code {
background-color: #f7f7f7;
border-radius: 3px;
color: #333;
white-space: pre-wrap; 
}
pre {
border-radius: 3px;
margin: 5px 0px 10px 0px;
padding: 10px;
}
pre:not([class]) {
background-color: #f7f7f7;
}
code {
font-family: Consolas, Monaco, 'Courier New', monospace;
font-size: 85%;
}
p > code, li > code {
padding: 2px 0px;
}
div.figure {
text-align: center;
}
img {
background-color: #FFFFFF;
padding: 2px;
border: 1px solid #DDDDDD;
border-radius: 3px;
border: 1px solid #CCCCCC;
margin: 0 5px;
}
h1 {
margin-top: 0;
font-size: 35px;
line-height: 40px;
}
h2 {
border-bottom: 4px solid #f7f7f7;
padding-top: 10px;
padding-bottom: 2px;
font-size: 145%;
}
h3 {
border-bottom: 2px solid #f7f7f7;
padding-top: 10px;
font-size: 120%;
}
h4 {
border-bottom: 1px solid #f7f7f7;
margin-left: 8px;
font-size: 105%;
}
h5, h6 {
border-bottom: 1px solid #ccc;
font-size: 105%;
}
a {
color: #0033dd;
text-decoration: none;
}
a:hover {
color: #6666ff; }
a:visited {
color: #800080; }
a:visited:hover {
color: #BB00BB; }
a[href^="http:"] {
text-decoration: underline; }
a[href^="https:"] {
text-decoration: underline; }

code > span.kw { color: #555; font-weight: bold; } 
code > span.dt { color: #902000; } 
code > span.dv { color: #40a070; } 
code > span.bn { color: #d14; } 
code > span.fl { color: #d14; } 
code > span.ch { color: #d14; } 
code > span.st { color: #d14; } 
code > span.co { color: #888888; font-style: italic; } 
code > span.ot { color: #007020; } 
code > span.al { color: #ff0000; font-weight: bold; } 
code > span.fu { color: #900; font-weight: bold; } 
code > span.er { color: #a61717; background-color: #e3d2d2; } 
</style>




</head>

<body>




<h1 class="title toc-ignore">L(og)R(ank)P(ower)S(ample Size)</h1>
<h4 class="author">H. Li; E. Kawaguchi</h4>
<h4 class="date">2024-03-03</h4>



<div id="use-this-package" class="section level2">
<h2>Use this package</h2>
<p>This package contains 4 functions for LogRank test adapted from John
Lachin’s paper. They are:</p>
<ul>
<li><p><code>Pi(Rct, T, EHR, THR, G=NULL)</code></p></li>
<li><p><code>lrps(Alpha,Pis,Haz,NP,Ratio=FALSE)</code></p></li>
<li><p><code>PowerPH(Beg,End,Inc,Alpha,Sigma,Evt)</code></p></li>
<li><p><code>PowerInt(Ratios,Evt,Sigma,Alpha)</code></p></li>
</ul>
</div>
<div id="pi" class="section level2">
<h2>Pi</h2>
<div id="description" class="section level3">
<h3>Description</h3>
<p>This function calculates <span class="math inline">\(\pi\)</span> -
the probability that the event is observed under the exponential
model.</p>
<p>This function is derived from section 2 of Lachin’s paper:
Lachin-Foulkes Exponential Model.</p>
</div>
<div id="usage" class="section level3">
<h3>Usage</h3>
<p>Execute <code>Prob(Rct, T, EHR, THR, G=)</code></p>
</div>
<div id="parameters" class="section level3">
<h3>Parameters</h3>
<div id="rct" class="section level4">
<h4>Rct</h4>
<p>numeric - Recruitment in years - corresponds to R in Lachin’s
article.</p>
</div>
<div id="t" class="section level4">
<h4>T</h4>
<p>numeric - Length of study in years - corresponds to T in Lachin’s
article.</p>
</div>
<div id="ehr" class="section level4">
<h4>EHR</h4>
<p>numeric - Event Hazard rate - corresponds to <span class="math inline">\(\lambda\)</span> in Lachin’s article.</p>
</div>
<div id="thr" class="section level4">
<h4>THR</h4>
<p>numeric - Total Hazard rate(Event hazard rate+loss hazard rate) this
corresponds to <span class="math inline">\(\lambda+\eta\)</span> in
Lachin’s article.</p>
</div>
<div id="g---optional" class="section level4">
<h4>G - Optional</h4>
<p>numeric - Shape parameter based on recruitment rate. This corresponds
to <span class="math inline">\(\gamma\)</span> value in Lachin’s
paper.</p>
<p>Note: If <code>G=NULL</code>, then recruitment is defaulted to
uniform entry.</p>
</div>
</div>
<div id="example" class="section level3">
<h3>Example</h3>
<div class="sourceCode" id="cb1"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb1-1"><a href="#cb1-1" tabindex="-1"></a><span class="fu">Pi</span>(<span class="dv">1</span>, <span class="dv">7</span>,<span class="fl">1.04</span>, <span class="dv">5</span>,<span class="sc">-</span><span class="fl">0.27</span>)</span>
<span id="cb1-2"><a href="#cb1-2" tabindex="-1"></a><span class="co">#&gt; [1] 0.208</span></span>
<span id="cb1-3"><a href="#cb1-3" tabindex="-1"></a><span class="fu">Pi</span>(<span class="dv">1</span>, <span class="dv">7</span>,<span class="fl">1.04</span>, <span class="dv">5</span>)</span>
<span id="cb1-4"><a href="#cb1-4" tabindex="-1"></a><span class="co">#&gt; [1] 0.208</span></span></code></pre></div>
<p>This example illustrates a study with a total 7 years of duration, 1
year of recruitment with an event hazard rate of 1.04, a total hazard
rate of 7 and a gamma value calculated by 40-60 recruitment distribution
between first and second half of the study of -0.127 yields an event
probability of 0.149.</p>
<p>We see a gamma correction factor -0.27 is small and does not make
significant difference in event probability.</p>
</div>
<div id="workflow" class="section level3">
<h3>Workflow</h3>
<p>This function executes the following calculation to output the event
probability.<span class="math inline">\(\pi\)</span>.</p>
<p>For a uniform recruitment:</p>
<p><span class="math display">\[
\pi=\frac{\lambda}{\lambda+\eta} \left[
1-\frac{e^{(-\lambda+\eta)(T-R)}-e^{-(\lambda+\eta)T}}{R(\lambda+\eta)}\right]
\]</span></p>
<p>And in context of this function:</p>
<p><span class="math display">\[
\pi=\frac{EHR}{THR} \left[
1-\frac{e^{(-THR)(T-Rct)}-e^{-(THR)T}}{Rct(THR)}\right]
\]</span></p>
<p>For a non-uniform recruitment with provided</p>
<p><span class="math display">\[
\pi=\frac{\lambda}{\lambda+\eta}+\left[\frac{\lambda\gamma
e^{-(\lambda+\eta)T}[1-e^{(\lambda+\eta-\gamma)R}]}{\lambda+\eta(\lambda+\eta-\gamma)(1-e^{-\gamma
R})}\right]
\]</span></p>
<p>and in the context of this function:</p>
<p><span class="math display">\[
\pi=\frac{EHR}{THR}+\left[\frac{EHR\cdot G \cdot e^{-EHR\cdot
T}[1-e^{(THR-G)Rct}]}{THR(THR-g)(1-e^{-G\cdot Rct})}\right]
\]</span></p>
</div>
</div>
<div id="lrps" class="section level2">
<h2>lrps</h2>
<div id="description-1" class="section level3">
<h3>Description</h3>
<p>This function computes the Power or Sample size of a K group
test.</p>
<p>This function is derived from section 3 of Lachin’s paper - An
ANOVA-like Test</p>
</div>
<div id="usage-1" class="section level3">
<h3>Usage</h3>
<p>Execute <code>lrps(Alpha,Pis,Haz,NP,Ratio=)</code></p>
</div>
<div id="parameters-1" class="section level3">
<h3>Parameters</h3>
<div id="alpha" class="section level4">
<h4>Alpha</h4>
<p>Numeric - Two sided type I error <span class="math inline">\(\iff
P(H_1(\theta_1\not=\theta_j \text{ for some 1} \le j \le
K)|H_0(\theta_1=\ldots=\theta_j))\)</span></p>
</div>
<div id="pis" class="section level4">
<h4>Pis</h4>
<p>Vector - Event probability.</p>
<p>The probability of event occurring as calculated by function
<code>Pi</code>. This corresponds to <span class="math inline">\(\pi\)</span> in Lachin’s paper.</p>
<p>Example:</p>
<p><code>c(0.335057,0.335057,0.2649026,0.2649026)</code></p>
</div>
<div id="haz" class="section level4">
<h4>Haz</h4>
<p>Vector - Hazard rate or Hazard Ratio</p>
<p>Example of Hazard rate:</p>
<p><code>c(0.0875,0.0875,0.065625,0.065625)</code></p>
<p>Example of Hazard ratio:</p>
<p><code>c(1,1,0.75,0.75)</code></p>
</div>
<div id="np" class="section level4">
<h4>NP</h4>
<p>Numeric - The known value - either the sample size (N) or Power (P).
The function automatically detects.</p>
<p>Example of power <code>NP=0.9</code></p>
<p>Example of Sample size (N) <code>NP=5000</code></p>
</div>
<div id="ratio---optional" class="section level4">
<h4>Ratio - Optional</h4>
<p>Boolean - Default value <code>FALSE</code> Indicates <code>Haz</code>
should be treated as Hazard Rates.</p>
<p>Note: If Ratio is set to <code>TRUE</code>, <code>Haz</code> is
treated like Hazard Ratios.</p>
</div>
</div>
<div id="example-1" class="section level3">
<h3>Example</h3>
<div class="sourceCode" id="cb2"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb2-1"><a href="#cb2-1" tabindex="-1"></a><span class="fu">lrps</span>(<span class="fl">0.05</span>,<span class="fu">c</span>(<span class="fl">0.335057</span>,<span class="fl">0.335057</span>,<span class="fl">0.2649026</span>,<span class="fl">0.2649026</span>),<span class="fu">c</span>(<span class="fl">0.0875</span>,<span class="fl">0.0875</span>,<span class="fl">0.065625</span>,<span class="fl">0.065625</span>),<span class="fl">0.90</span>)</span>
<span id="cb2-2"><a href="#cb2-2" tabindex="-1"></a><span class="co">#&gt;      N   n</span></span>
<span id="cb2-3"><a href="#cb2-3" tabindex="-1"></a><span class="co">#&gt; 1 2316 579</span></span>
<span id="cb2-4"><a href="#cb2-4" tabindex="-1"></a><span class="fu">lrps</span>(<span class="fl">0.05</span>,<span class="fu">c</span>(<span class="fl">0.335057</span>,<span class="fl">0.335057</span>,<span class="fl">0.2649026</span>,<span class="fl">0.2649026</span>),<span class="fu">c</span>(<span class="fl">0.0875</span>,<span class="fl">0.0875</span>,<span class="fl">0.065625</span>,<span class="fl">0.065625</span>),<span class="dv">2315</span>)</span>
<span id="cb2-5"><a href="#cb2-5" tabindex="-1"></a><span class="co">#&gt;       power</span></span>
<span id="cb2-6"><a href="#cb2-6" tabindex="-1"></a><span class="co">#&gt; 1 0.9000102</span></span>
<span id="cb2-7"><a href="#cb2-7" tabindex="-1"></a><span class="fu">lrps</span>(<span class="fl">0.05</span>,<span class="fu">c</span>(<span class="fl">0.335057</span>,<span class="fl">0.335057</span>,<span class="fl">0.2649026</span>,<span class="fl">0.2649026</span>),<span class="fu">c</span>(<span class="dv">1</span>,<span class="dv">1</span>,<span class="fl">0.75</span>,<span class="fl">0.75</span>),<span class="dv">2315</span>,<span class="at">Ratio=</span><span class="cn">TRUE</span>)</span>
<span id="cb2-8"><a href="#cb2-8" tabindex="-1"></a><span class="co">#&gt;      phsPwr</span></span>
<span id="cb2-9"><a href="#cb2-9" tabindex="-1"></a><span class="co">#&gt; 1 0.9043012</span></span></code></pre></div>
<p>This example demonstrates a 7 year study with 3 years of recruitment
period, assume the type I error is 0.05, group 3 and 4 are superior
treatments and have <span class="math inline">\(\frac{3}{4}\)</span> of
the hazard rate than group 1 and 2 with a reference hazard rate of
0.0875. We assume the loss-of-followup rate is 0.04. The shape parameter
is -0.27 (calculated based on a 40-60 recruitment distribution between
first and second half of the study). To calculate sample size needed for
a power of 0.9, then the output is 2316 total subjects with 579 subjects
in each group. And indeed, the power for the same study with 2316
subjects is 0.9.</p>
</div>
<div id="workflow-1" class="section level3">
<h3>Workflow</h3>
<p>The <code>lrps</code> is a dummy function that calls the function</p>
<ul>
<li><p><code>Nmain(alpha,pis,haz,power)</code> (NP <span class="math inline">\(\mapsto\)</span> Power) and calculates Sample
Size</p>
<p>or</p></li>
<li><p><code>Powermain(alpha,pis,haz,N)</code> (NP <span class="math inline">\(\mapsto\)</span> Sample Size) and calculates power
under log hazard rate model.</p>
<p>or</p></li>
<li><p><code>PowerPHmain(alpha,pis,rrs,N)</code>(NP <span class="math inline">\(\mapsto\)</span> Sample Size) and calculates Power
under proportional hazard model.</p></li>
</ul>
<p>Using this flow chart:</p>
<p><span class="math display">\[
\text{lrps}\begin {cases} \text{lrps($\ldots$,Ratios=FALSE, NP)}\mapsto
\begin{cases} \text{Nmain($\ldots$,Power=NP)} &amp;\text{ NP}\le 1\\
\phantom{m} \\ \text{Powermain($\ldots$,N=NP)}&amp;\text{ Otherwise}
\end{cases} \\
\hfill  \\
\hfill\\
\text{lrps($\ldots$,Ratios=TRUE, NP)}
\mapsto
\text{PowerPHmain (}\ldots,\text{N=NP)}
\end{cases}
\]</span></p>
<p>In this case, the function recognizes that power are always below 1
and sample size are always above 1.</p>
<div id="calculation-of-sample-size-n" class="section level4">
<h4>Calculation of Sample Size <code>N</code></h4>
<p>When the last parameter <code>NP</code> <span class="math inline">\(\le 1\)</span>. <code>lrps</code> will assume the
parameter <code>NP</code> is Power and computes sample size by calling
function <code>Nmain</code> .</p>
<p><code>Nmain</code> first calculates the <em>minimum variance linear
estimator</em> <em>(</em> <span class="math inline">\(\hat{\theta}\)</span> ):</p>
<p><span class="math display">\[
\hat{\theta}=\frac{\sum_{j=1}^K D_j\hat{\theta_j}}{\sum_{j=1}^K D_j}
\]</span></p>
<p>where as <code>K=length(Pis)</code>. <span class="math inline">\(D_j\)</span>=<span class="math inline">\(\pi_j
\frac{1}{k}=\)</span> <code>Pis[j]</code> <span class="math inline">\(\cdot \frac{1}{k}\)</span> and <span class="math inline">\(\hat{\theta}_j\)</span> is the log of the hazard
rate = <span class="math inline">\(\log\)</span>(<code>haz[j])</code>.</p>
<p>The Non-Centrality Parameter value <span class="math inline">\(\psi^2\)</span> for the non-central <span class="math inline">\(\chi^2\)</span> distribution on a <code>k-1</code>
degrees of freedom (df) is:</p>
<p><span class="math inline">\(\psi^2
=\)</span><code>uniroot(function(x) pchisq(qchisq(1 - Alpha, df), df, ncp = x) - (1 - power), c(0, 10000000))$root</code></p>
<p>Then, <code>Nmain</code> calculates the non-centrality factor <span class="math inline">\(\varphi^2\)</span></p>
<p><span class="math display">\[\varphi^2 = \sum_{j=1}^K
D_j(\hat{\theta}_j-\hat{\theta})^2\]</span></p>
<p>Finally the sample size <code>N</code> is calculated by:</p>
<p><span class="math display">\[
N=\frac{\psi^2}{\varphi^2}
\]</span></p>
</div>
<div id="calculation-of-power-using-log-hazard-rates" class="section level4">
<h4>Calculation of Power using log hazard rates</h4>
<p>When the last parameter NP <span class="math inline">\(&gt;
1\)</span> <code>lrps</code> will assume the parameter is Sample size
and computes Power by calling function <code>Powermain</code></p>
<p><code>Powermain</code> first calculates the <em>minimum variance
linear estimator (</em> <span class="math inline">\(\hat{\theta}\)</span> <em>):</em></p>
<p><span class="math display">\[ \hat{\theta}=\frac{\sum_{j=1}^K
E(D_j)\hat{\theta_j}}{\sum_{j=1}^K E(D_j)} \]</span></p>
<p>whereas <code>K=length(pis)</code>. The expected event <span class="math inline">\(E(D_j)\)</span>=<span class="math inline">\(\frac{N}{K}\pi_j\)</span>.</p>
<p>And <span class="math inline">\(\pi_j\)</span> denote the event
probability <code>Pi[j]</code> calculated by the function
<code>Pi</code> and <span class="math inline">\(\hat{\theta}_j\)</span>
is the log of the hazard rate = <span class="math inline">\(\log\)</span>(<code>haz[j]</code>).</p>
<p><code>Powermain</code> then calculates the Non-Centrality Parameter
<span class="math inline">\(\psi^2\)</span></p>
<p><span class="math display">\[
\psi^2=\sum_{j=1}^K E(D_j)(\hat{\theta}_j-\hat{\theta})^2
\]</span></p>
<p>Finally the power is calculated by 1- <span class="math inline">\(\chi^2\)</span> distribution with k-1 degrees of
freedom (<code>df</code>) and <span class="math inline">\(\psi^2\)</span> as the Non-Centrality
Parameter.</p>
<p><span class="math display">\[
\text{Power}=1-\beta
\]</span></p>
<p>whereas <span class="math inline">\(\beta\)</span> =
<code>pchisq(qchisq(1 - alpha, df) , df, ncp = ncp, lower.tail = TRUE, log.p = FALSE)</code></p>
</div>
<div id="calculation-of-power-using-log-hazard-ratios" class="section level4">
<h4>Calculation of Power using log hazard ratios</h4>
<p>When the variable <code>ratios</code> is set to be true,
<code>lrps</code> will assume <code>NP</code> is sample size (N) and
call function <code>PowerPHmain</code> using proportional hazard
model.</p>
<p><code>PowerPHmain</code> first Calculate the expected number of
events <code>Eds</code> for each group: <code>Eds</code> <span class="math inline">\(= N \cdot \frac{1}{k} \cdot \text{pis[j]}
\quad\)</span></p>
<p>Then the total number of expect event <code>totevt</code> is
calculated by <span class="math inline">\(\sum_{j=1}^{K}
eds_j\)</span></p>
<p>The non-centrality parameter (NCP) <span class="math inline">\(\psi^2\)</span> is calculated by:</p>
<p><span class="math display">\[
\text{phsncp} = \sum_{j=2}^{K} \left( \text{totevt} \cdot \frac{1}{k}
\cdot \left(1 -
\frac{1}{k}\right) \cdot \beta_j^2 \right) - \sum_{j=2}^{K-1}
\sum_{k=j+1}^{K} \left( 2 \cdot \text{totevt} \cdot \frac{1}{k} \cdot
\frac{1}{k} \cdot \beta_j \cdot \beta_k \right)
\]</span></p>
<p>where <span class="math inline">\(\beta_j\)</span> is log of hazard
ratios <code>Haz[j]</code>.</p>
<p>Finally the power is calculated by 1- <span class="math inline">\(\chi^2\)</span> distribution with k-1 degrees of
freedom (<code>df</code>).</p>
<p><span class="math display">\[ \text{phspower}=1-\beta \]</span></p>
<p>whereas <span class="math inline">\(\beta\)</span> =
<code>pchisq(qchisq(1 - alpha, df) , df, ncp = phsncp, lower.tail = TRUE, log.p = FALSE)</code></p>
</div>
</div>
</div>
<div id="powerph" class="section level2">
<h2>PowerPH</h2>
<div id="description-2" class="section level3">
<h3>Description</h3>
<p>This function calculates the power of association for a quantitative
covariate under the Proportional Hazard model.</p>
<p>This function is derived from section 9 of Lachin’s paper:
<em>Quantitative Covariate Effects</em>.</p>
</div>
<div id="usage-2" class="section level3">
<h3>Usage</h3>
<p>execute <code>PowerPH(Beg,End,Inc,Alpha,Sigma,Evt)</code></p>
</div>
<div id="parameters-2" class="section level3">
<h3>Parameters</h3>
<div id="beg" class="section level4">
<h4>Beg</h4>
<p>Numeric - The start point of hazard ratio per standard deviation
change.</p>
</div>
<div id="end" class="section level4">
<h4>End</h4>
<p>Numeric - The end point of hazard ratio per standard deviation
change.</p>
</div>
<div id="inc" class="section level4">
<h4>Inc</h4>
<p>Numeric - Unit of increasing of hazard ratio per standard deviation
change.</p>
</div>
<div id="alpha-1" class="section level4">
<h4>Alpha</h4>
<p>Numeric - Two sided Type I error <span class="math inline">\(\iff
P(H_1|H_0)\)</span></p>
</div>
<div id="sigma" class="section level4">
<h4>Sigma</h4>
<p>Numeric - Standard deviation of the covariate, this is <span class="math inline">\(\sigma\)</span> in Lachin’s paper.</p>
</div>
<div id="evt" class="section level4">
<h4>Evt</h4>
<p>Numeric - Number of total events expected for N subjects. This can be
calculated by <span class="math display">\[\sum_{j=1}^K N
\zeta_j\pi_j\]</span> Whereas <span class="math inline">\(\zeta_j\)</span> is sample fraction of subjects
assigned to each group. <span class="math inline">\(\pi_j\)</span> is
the event probability calculated by function <code>Prob</code>.</p>
</div>
</div>
<div id="example-2" class="section level3">
<h3>Example</h3>
<div class="sourceCode" id="cb3"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb3-1"><a href="#cb3-1" tabindex="-1"></a><span class="fu">PowerPH</span>(<span class="fl">1.1</span>,<span class="fl">1.4</span>,<span class="fl">0.05</span>,<span class="fl">0.05</span>,<span class="dv">10</span>,<span class="dv">1576</span>)</span>
<span id="cb3-2"><a href="#cb3-2" tabindex="-1"></a><span class="co">#&gt;   hrsd powerassoc</span></span>
<span id="cb3-3"><a href="#cb3-3" tabindex="-1"></a><span class="co">#&gt; 1 1.10    0.96590</span></span>
<span id="cb3-4"><a href="#cb3-4" tabindex="-1"></a><span class="co">#&gt; 2 1.15    0.99983</span></span>
<span id="cb3-5"><a href="#cb3-5" tabindex="-1"></a><span class="co">#&gt; 3 1.20    1.00000</span></span>
<span id="cb3-6"><a href="#cb3-6" tabindex="-1"></a><span class="co">#&gt; 4 1.25    1.00000</span></span>
<span id="cb3-7"><a href="#cb3-7" tabindex="-1"></a><span class="co">#&gt; 5 1.30    1.00000</span></span>
<span id="cb3-8"><a href="#cb3-8" tabindex="-1"></a><span class="co">#&gt; 6 1.35    1.00000</span></span>
<span id="cb3-9"><a href="#cb3-9" tabindex="-1"></a><span class="co">#&gt; 7 1.40    1.00000</span></span></code></pre></div>
<p>This example illustrates the calculation of power of association for
each 0.05 increases from 1.1 to 1.4 per standard deviation change in
covariate hazard ratio with 1576 expected events within the group and
standard 0.05 significance level.</p>
<p>We see that the HR per standard deviation change of 1.1 yield a power
of 0.96 and 1.4 yield a power of almost 1.</p>
</div>
<div id="workflow-2" class="section level3">
<h3>Workflow</h3>
<p>For each iteration of <span class="math inline">\(\text{HR}_{\text{SD}} \in [\text{srt,end}] \text{
by inc}\)</span> ,<code>PowerPH</code> performs the following to output
a <code>powerassoc</code>.</p>
<p><code>PowerPH</code> first calculates the Non-centrality parameter of
the test <span class="math inline">\(\psi^2\)</span> :</p>
<p><span class="math display">\[
\psi^2=(\frac{\theta}{\text{std. error}})^2
\]</span></p>
<p>Whereas <span class="math inline">\(\theta\)</span> is the Log of
each <span class="math inline">\(\text{HR}_{\text{SD}}\)</span>.</p>
<p>In <code>PowerPH</code> <span class="math inline">\(\psi^2\)</span>
is calculated by:</p>
<p><span class="math display">\[
\psi^2=\log{({\text{HR}_{\text{SD}}}}^{\frac{1}{\sigma}})^2\cdot D \cdot
\sigma^2
\]</span></p>
<p>The type II error <span class="math inline">\(\beta\)</span> is
calculated by:</p>
<p><span class="math inline">\(\beta=\)</span>
<code>pchisq(qchisq(1-Alpha, 1), 1, ncp=NCPassoc, lower.tail = TRUE,log.p=FALSE)</code>.
Whereas <code>NCPassoc</code> is <span class="math inline">\(\psi^2\)</span>.</p>
<p>Finally, power is calculated by:</p>
<p><span class="math display">\[
\text{Power=1-}\beta
\]</span></p>
</div>
</div>
<div id="powerint" class="section level2">
<h2>PowerInt</h2>
<div id="description-3" class="section level3">
<h3>Description</h3>
<p>This function calculates the power of the Cochran’s Q test for a
K-group test by quantitative covariate interaction.</p>
<p>This function is derived from section 9 of Lachin’s paper:
<em>Quantitative Covariate Effects.</em></p>
</div>
<div id="usage-3" class="section level3">
<h3>Usage</h3>
<p>Execute <code>PowerInt(Ratios,Evt,Sigma,Alpha)</code></p>
</div>
<div id="parameters-3" class="section level3">
<h3>Parameters</h3>
<div id="ratios" class="section level4">
<h4>Ratios</h4>
<p>Vector - Hazard ratio coefficient values.</p>
</div>
<div id="evt-1" class="section level4">
<h4>Evt</h4>
<p>Numeric - Expected number of event for each group. This can be
calculated by <span class="math display">\[N \zeta_j\pi_j\]</span> where
as <span class="math inline">\(\zeta_j\)</span> is sample fraction of
subjects assigned to each group, <span class="math inline">\(\pi_j\)</span> is the event probability calculated
by function <code>Prob</code> .</p>
</div>
<div id="sigma-1" class="section level4">
<h4>Sigma</h4>
<p>Numeric - Standard deviation <span class="math inline">\(\sigma_k\)</span> of the covariate.</p>
</div>
<div id="alpha-2" class="section level4">
<h4>Alpha</h4>
<p>Numeric - Two sided type I error <span class="math inline">\(\iff
P(H_1|H_0)\)</span>.</p>
</div>
</div>
<div id="example-3" class="section level3">
<h3>Example</h3>
<div class="sourceCode" id="cb4"><pre class="sourceCode r"><code class="sourceCode r"><span id="cb4-1"><a href="#cb4-1" tabindex="-1"></a><span class="fu">PowerInt</span>(<span class="fu">c</span>(<span class="fl">1.55</span>, <span class="fl">1.45</span>, <span class="fl">1.35</span>, <span class="fl">1.25</span>),<span class="dv">394</span>,<span class="dv">10</span>,<span class="fl">0.05</span>)</span>
<span id="cb4-2"><a href="#cb4-2" tabindex="-1"></a><span class="co">#&gt;   powercochran</span></span>
<span id="cb4-3"><a href="#cb4-3" tabindex="-1"></a><span class="co">#&gt; 1    0.7671103</span></span></code></pre></div>
<p>This example illustrates 4 covariate hazard ratio coefficients of
1.55,1.45,1.35,1.25 with each group having expected 394 events with
standard significance level of 0.05 and standard deviation of 10 yields
a power of only 0.76 to detect those difference in hazard ratios.</p>
</div>
<div id="workflow-3" class="section level3">
<h3>Workflow</h3>
<p><code>PowerInt</code> First calculates the <em>Minimum Variance
Linear Estimator (MVLE)</em> of the common coefficient among group <span class="math inline">\(\hat{\beta}\)</span>.</p>
<p><span class="math display">\[\hat{\beta}=\frac{\sum_{j=1}^K
D_j\sigma_j^2\hat{\beta_j}}{\sum_{j=1}^K D_j\sigma_j^2}\]</span> Whereas
<span class="math inline">\(D_j\)</span> is <code>Evt</code> , the
expected event among each group, <span class="math inline">\(\sigma_j\)</span> is <code>sd</code> ,the standard
deviation of covariate and <span class="math inline">\(\hat{\beta}_j\)</span> is the Log of the hazard
ratio per unit increase in covariate which is <span class="math inline">\(\log({\text{HRs}^\text{sdk}})\)</span> .</p>
<p><code>PowrInt</code> Then calculates the non centrality factor <span class="math inline">\(\psi^2\)</span> of the test of the hypothesis of
homogeneity of the covariate effects among groups.</p>
<p><span class="math display">\[
\psi^2=\sum_{j=1}^{K-1}D_j\sigma^2_j (\hat{\beta}-\hat{\beta}_j)
\]</span></p>
<p>The notations of this equation and equivalent parameters are the same
as the notation of the MVLE as shown above.</p>
<p>Finally the Type II Error <span class="math inline">\(\beta\)</span>
is calculated by
<code>pchisq(qchisq(1-alpha, df), df, ncp=NCPcochran, lower.tail=TRUE, log.p=FALSE)</code>.
Whereas <code>df</code> is the degrees of freedom k-1 and NCPcochran is
<span class="math inline">\(\psi\)</span>.</p>
<p>The power is calculated by</p>
<p><span class="math display">\[
\text{Power=1-}\beta
\]</span></p>
</div>
</div>
<div id="further-reading-and-references" class="section level2">
<h2>Further reading and References</h2>
<p>1: Lachin JM. Sample size and power for a logrank test and Cox
proportional hazards model with multiple groups and strata, or a
quantitative covariate with multiple strata. <em>Stat Med</em>.
2013;32(25):4413-4425. <a href="doi:10.1002/sim.5839" class="uri">doi:10.1002/sim.5839</a> 2: Lachin JM, Foulkes MA.
Evaluation of sample size and power for analyses of survival with
allowance for nonuniform patient entry, losses to follow-up,
noncompliance, and stratification. Biometrics. 1986;42(3):507-519.</p>
</div>



<!-- code folding -->


<!-- dynamically load mathjax for compatibility with self-contained -->
<script>
  (function () {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  })();
</script>

</body>
</html>
