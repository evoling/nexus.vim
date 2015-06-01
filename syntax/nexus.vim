" Vim syntax file
" Language:	Nexus file format with reserved words for MrBayes
" Maintainer:	Luis Carvalho <lexcarvalho@hotmail.com>
" Last Change:	2004 Apr 17

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Public blocks
syn keyword	nexusBlock	begin end
syn keyword	nexusPublic	taxa characters unaligned distances
syn keyword	nexusPublic	sets assumptions codons trees notes
" Main reserved words
syn keyword	nexusBatch	dimensions format matrix translate tree
syn keyword	nexusBatch	taxlabels
" Commands
syn keyword	nexusCommand	charset charstat comparetree ctype
syn keyword	nexusCommand	databreaks delete deroot exclude
syn keyword	nexusCommand	execute include link log
syn keyword	nexusCommand	lset mcmc mcmcp outgroup
syn keyword	nexusCommand	pairs partition plot prset
syn keyword	nexusCommand	props report restore root
syn keyword	nexusCommand	set showmatrix showmodel showtree
syn keyword	nexusCommand	sump sumt taxastat taxset
syn keyword	nexusCommand	unlink usertree
" Further commands (added 2015-06-01)
syn keyword	nexusCommand	constraint
syn keyword	nexusCommand	about acknowledgments calibrate
syn keyword	nexusCommand	citations disclaimer endblock
syn keyword	nexusCommand	help manual propset
syn keyword	nexusCommand	quit showbeagle showmcmctrees
syn keyword	nexusCommand	showmoves showparams showusertrees
syn keyword	nexusCommand	speciespartition ss ssp
syn keyword	nexusCommand	startvals sumss version
" Parameters
syn keyword	nexusParameter	unordered ordered irreversible
syn keyword	nexusParameter	tratio revmat omega statefreq
syn keyword	nexusParameter	shape pinvar correlation switchrates
syn keyword	nexusParameter	brlens topology speciationrates
syn keyword	nexusParameter	extinctionrates theta
syn keyword	nexusParameter	start stop append replace
syn keyword	nexusParameter	nucmodel nst code rates
syn keyword	nexusParameter	ngammacat nbetacat omegavar covarion
syn keyword	nexusParameter	coding parsmodel
syn keyword	nexusParameter	seed ngen samplefreq swapfreq
syn keyword	nexusParameter	printfreq nchains temp reweight
syn keyword	nexusParameter	burnin startingtree nperts savebrlens
syn keyword	nexusParameter	parameter match
syn keyword	nexusParameter	tratiopr revmatpr aamodelpr omegapr
syn keyword	nexusParameter	ny98omega1pr ny98omega3pr m3omegapr
syn keyword	nexusParameter	codoncatfreqs statefreqpr ratepr shapepr
syn keyword	nexusParameter	ratecorrpr pinvarpr covswitchpr
syn keyword	nexusParameter	symmetricbetapr topologypr brlenspr
syn keyword	nexusParameter	speciationpr extinctionpr sampleprob thetapr
syn keyword	nexusParameter	ratemult autoclose nowarnings
syn keyword	nexusParameter	displaygeq contype showtreeprobs
" Further parameters (added 2015-06-01)
syn keyword     nexusParameter  nruns applyto ancstates filename
syn keyword	nexusParameter	aamodel aarevmatpr about
syn keyword	nexusParameter	acknowledgments allchains allcomps
syn keyword	nexusParameter	allruns alpha askmore
syn keyword	nexusParameter	autoreplace autotune burninfrac
syn keyword	nexusParameter	burninss calctreeprobs calibrate
syn keyword	nexusParameter	checkfreq checkpoint citations
syn keyword	nexusParameter	clockratepr clockvarpr conformat
syn keyword	nexusParameter	cppevents cppmultdev cppmultdevpr
syn keyword	nexusParameter	cpprate cppratepr data
syn keyword	nexusParameter	diagnfreq diagnstat discardfrac
syn keyword	nexusParameter	disclaimer endblock extinctionrate
syn keyword	nexusParameter	filename1 filename2 fossilizationpr
syn keyword	nexusParameter	fromprior generatepr growthrate
syn keyword	nexusParameter	help hpd igrvar
syn keyword	nexusParameter	igrvarpr manual mcmcdiagn
syn keyword	nexusParameter	minpartfreq minprob mixedvar
syn keyword	nexusParameter	nodeagepr nsteps nswaps
syn keyword	nexusParameter	ntrees ordertaxa outputname
syn keyword	nexusParameter	ploidy popsize popsizepr
syn keyword	nexusParameter	popvarpr possel precision
syn keyword	nexusParameter	printall printmax propset
syn keyword	nexusParameter	quit quitonerror ratemultiplier
syn keyword	nexusParameter	relburnin revratepr samplestrat
syn keyword	nexusParameter	savetrees scientific showbeagle
syn keyword	nexusParameter	showmcmctrees showmoves showparams
syn keyword	nexusParameter	showusertrees siteomega siterates
syn keyword	nexusParameter	smoothing speciationrate speciespartition
syn keyword	nexusParameter	ss ssp startparams
syn keyword	nexusParameter	starttree startvals steptoplot
syn keyword	nexusParameter	stoprule stopval sumss
syn keyword	nexusParameter	swapseed tk02var tk02varpr
syn keyword	nexusParameter	treeagepr tunefreq version
" Options
syn keyword	nexusOptionsR	4by4 doublet codon
syn keyword	nexusOptionsR	universal vertmt mycoplasma
syn keyword	nexusOptionsR	yeast ciliates metmt
syn keyword	nexusOptionsR	equal gamma propinv invgamma adgamma
syn keyword	nexusOptionsR	noabsencesites nopresencesites
syn keyword	nexusOptionsR	random user perfect consistentwith
syn keyword	nexusOptionsR	scaled ratio dir
syn keyword	nexusOptionsR	halfcompat allcompat
" Aamodelpr options (added 2015-06-01)
syn keyword     nexusOptionsR   poisson jones dayhoff mtrev mtmam wag rtrev cprev vt blosum lg equalin gtr
syn keyword	nexusOptionsD	fixed variable beta dirichlet
syn keyword	nexusOptionsD	uniform exponential constraints
syn keyword	nexusOptionsD	unconstrained clock
syn keyword	nexusOptionsD	dna rna protein restriction standard
syn keyword	nexusOptionsD	continuous mixed
" Further distributions (added 2015-06-01)
syn keyword	nexusOptionsD	etbr exp exttbr
syn keyword	nexusOptionsD	gammadir invgamdir lognormal
syn keyword	nexusOptionsD	normal offsetexponential offsetgamma
syn keyword	nexusOptionsD	offsetlognormal prob symdir
syn keyword	nexusOptionsD	truncatednormal twoexp
" Format options
syn keyword	nexusOptionsB	ntax nchar datatype interleave
syn keyword	nexusOptionsB	gap missing matchchar
" Categorical
syn keyword	nexusCategorical	yes no all

syn keyword	nexusTodo		contained TODO FIXME XXX

" nexusCommentGroup allows adding matches for special things in comments
syn cluster	nexusCommentGroup	contains=nexusTodo


"catch errors caused by wrong parenthesis and brackets
syn cluster	nexusParenexusGroup	contains=nexusParenexusError,@nexusCommentGroup,nexusCommentStartError,nexusNumber,nexusFloat
syn region	nexusParen		transparent start='(' end=')' contains=ALLBUT,@nexusParenexusGroup,nexusErrInexusBracket
syn match	nexusParenexusError	display "[\])]"
syn match	nexusErrInexusParen	display contained "[\]{}]"
syn region	nexusBracket		transparent start='\[' end='\]' contains=ALLBUT,@nexusParenexusGroup,nexusErrInexusParen
syn match	nexusErrInexusBracket	display contained "[);{}]"

"integer or floating point number
syn case ignore
syn match	nexusNumbersCom		display transparent "\<\d\|\.\d" contains=nexusNumber,nexusFloat
syn match	nexusNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	nexusNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
"floating point number, with dot, optional exponent
syn match	nexusFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	nexusFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	nexusFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

"comments
syn region	nexusComment	start="\[" end="\]" contains=@nexusCommentGroup,nexusCommentStartError
syntax match	nexusCommentError	display "\]"
syntax match	nexusCommentStartError	display "\["me=e-1 contained


" Define the default highlighting
if version >= 508 || !exists("did_nexus_syn_inits")
  if version < 508
    let did_nexus_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

	HiLink nexusBlock		Repeat
	HiLink nexusPublic		Structure
	HiLink nexusBatch		Conditional
	HiLink nexusCommand		Statement
	HiLink nexusParameter		Type
	HiLink nexusOptionsR		String
	HiLink nexusOptionsD		Character
	HiLink nexusOptionsB		Include
	HiLink nexusCategorical		Constant

	HiLink nexusNumber		Number
	HiLink nexusNumber		Number
	HiLink nexusFloat		Float
	HiLink nexusParenexusError	nexusError
	HiLink nexusErrInexusParen	nexusError
	HiLink nexusErrInexusBracket	nexusError
	HiLink nexusCommentError	nexusError
	HiLink nexusCommentStartError	nexusError
	HiLink nexusError		Error
	HiLink nexusCommentStart	nexusComment
	HiLink nexusComment		Comment
	HiLink nexusTodo		Todo

	delcommand HiLink
endif

let b:current_syntax = "nexus"

" vim: ts=8
