" Vim syntax file
" Language:    jasmine for coffee
" Maintainer:  othree <othree@gmail.com>
" Last Change: 2016/04/19
" Version:     2.0
" URL:         http://jasmine.github.io/


syntax keyword coffeeJasmine jasmine containedin=ALLBUT,coffeeComment,coffeeLineComment,coffeeString,coffeeTemplate,coffeeTemplateSubstitution nextgroup=coffeeJdot
syntax match   coffeeJdot contained /\./ nextgroup=coffeeJMethods
syntax keyword coffeeJMethods contained any createSpy createSpyObj HtmlReporter Clock getEnv

syntax keyword coffeeJMethods contained tick useMock
syntax keyword coffeeJMethods contained addReporter specFilter

syntax cluster coffeeJFunctions      contains=coffeeJMethods,coffeeJEnvMethods,coffeeJEnvMethods,coffeeJExpectMethods,coffeeJSpyMethods,coffeeJSpyAndMethods,coffeeJSpyCallsMethods
syntax cluster coffeeJAttrs      contains=coffeeJExpectNot,coffeeJSpyAnd,coffeeJSpyCalls

syntax keyword coffeeJGlobalMethod describe done runs waitsFor it beforeEach afterEach containedin=ALLBUT,coffeeComment,coffeeLineComment,coffeeString nextgroup=@coffeeAfterIdentifier

syntax keyword coffeeJGlobalMethod xdescribe xit containedin=ALLBUT,coffeeComment,coffeeLineComment,coffeeString nextgroup=@coffeeAfterIdentifier

syntax keyword coffeeJGlobalMethod spyOn containedin=ALLBUT,coffeeComment,coffeeLineComment,coffeeString nextgroup=@coffeeAfterIdentifier

syntax keyword coffeeJSpyAnd and contained
syntax keyword coffeeJSpyAndMethods returnValue callFake throwError stub contained
syntax keyword coffeeJSpyCalls calls contained
syntax keyword coffeeJSpyMethods andReturn andCallThrough callThrough contained
syntax keyword coffeeJCallsMethods any count argsFor allArgs all mostRecent first reset contained

syntax keyword coffeeJGlobalMethod expect containedin=ALLBUT,coffeeComment,coffeeLineComment,coffeeString nextgroup=@coffeeAfterIdentifier
syntax keyword coffeeJExpectNot not contained nextgroup=coffeeJExpectNotdot

syntax keyword coffeeJExpectMethods toHaveBeenCalled toHaveBeenCalledWith toEqual toBe toMatch contained
syntax keyword coffeeJExpectMethods toBeDefined toBeUndefined toBeNull toBeTruthy toBeFalsy contained
syntax keyword coffeeJExpectMethods toContain toBeCloseTo toBeLessThan toBeGreaterThan toThrow contained


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_requirejs_coffee_syntax_inits")
  if version < 508
    let did_requirejs_coffee_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink coffeeJasmine         Underline
  HiLink coffeeJMethods        Function
  HiLink coffeeJEnvMethods     Function
  HiLink coffeeJClockMethods   Function
  HiLink coffeeJGlobalMethod   Function
  HiLink coffeeJSpyAnd         Function
  HiLink coffeeJSpyAndMethods  Function
  HiLink coffeeJSpyCalls       Function
  HiLink coffeeJSpyMethods     Function
  HiLink coffeeJCallsMethods   Function
  HiLink coffeeJExpectNot      Function
  HiLink coffeeJExpectMethods  Function

  delcommand HiLink
endif
