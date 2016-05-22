" Vim syntax file
" Language:    jasmine for ls
" Maintainer:  othree <othree@gmail.com>
" Last Change: 2016/04/19
" Version:     2.0
" URL:         http://jasmine.github.io/


syntax keyword lsJasmine jasmine containedin=ALLBUT,lsComment,lsLineComment,lsString,lsTemplate,lsTemplateSubstitution nextgroup=lsJdot
syntax match   lsJdot contained /\./ nextgroup=lsJMethods
syntax keyword lsJMethods contained any createSpy createSpyObj HtmlReporter Clock getEnv

syntax keyword lsJMethods contained tick useMock
syntax keyword lsJMethods contained addReporter specFilter

syntax cluster lsJFunctions      contains=lsJMethods,lsJEnvMethods,lsJEnvMethods,lsJExpectMethods,lsJSpyMethods,lsJSpyAndMethods,lsJSpyCallsMethods
syntax cluster lsJAttrs      contains=lsJExpectNot,lsJSpyAnd,lsJSpyCalls

syntax keyword lsJGlobalMethod describe done runs waitsFor it beforeEach afterEach containedin=ALLBUT,lsComment,lsLineComment,lsString nextgroup=@lsAfterIdentifier

syntax keyword lsJGlobalMethod xdescribe xit containedin=ALLBUT,lsComment,lsLineComment,lsString nextgroup=@lsAfterIdentifier

syntax keyword lsJGlobalMethod spyOn containedin=ALLBUT,lsComment,lsLineComment,lsString nextgroup=@lsAfterIdentifier

syntax keyword lsJSpyAnd and contained
syntax keyword lsJSpyAndMethods returnValue callFake throwError stub contained
syntax keyword lsJSpyCalls calls contained
syntax keyword lsJSpyMethods andReturn andCallThrough callThrough contained
syntax keyword lsJCallsMethods any count argsFor allArgs all mostRecent first reset contained

syntax keyword lsJGlobalMethod expect containedin=ALLBUT,lsComment,lsLineComment,lsString nextgroup=@lsAfterIdentifier
syntax keyword lsJExpectNot not contained nextgroup=lsJExpectNotdot

syntax keyword lsJExpectMethods toHaveBeenCalled toHaveBeenCalledWith toEqual toBe toMatch contained
syntax keyword lsJExpectMethods toBeDefined toBeUndefined toBeNull toBeTruthy toBeFalsy contained
syntax keyword lsJExpectMethods toContain toBeCloseTo toBeLessThan toBeGreaterThan toThrow contained


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_requirejs_ls_syntax_inits")
  if version < 508
    let did_requirejs_ls_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink lsJasmine         Underlined
  HiLink lsJMethods        Function
  HiLink lsJEnvMethods     Function
  HiLink lsJClockMethods   Function
  HiLink lsJGlobalMethod   Function
  HiLink lsJSpyAnd         Function
  HiLink lsJSpyAndMethods  Function
  HiLink lsJSpyCalls       Function
  HiLink lsJSpyMethods     Function
  HiLink lsJCallsMethods   Function
  HiLink lsJExpectNot      Function
  HiLink lsJExpectMethods  Function

  delcommand HiLink
endif
