tests: all
%.js: %.nim
	nim js -d:release --path:../pages/ $<
	sed -e 's/test.js/$@/g' test.html > $(@:.js=.html)
clean:
	$(RM) test?*.js
	$(RM) test?*.html
all:
	$(MAKE) \
	 test1.js \
	 test2.js \
	 test3.js \
	 test4.js \
	 test5.js \
	 test6.js \
	 test7.js \
	 test8.js \
	 #End
