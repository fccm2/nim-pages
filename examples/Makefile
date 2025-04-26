%.js: %.nim
	nim js -d:release --path:../pages/ $<
	sed -e 's/test.js/$@/g' test.html > $(@:.js=.html)
clean:
	$(RM) test?*.js
	$(RM) test?*.html
all:
	$(MAKE) \
	 test1.js \
	 #End
