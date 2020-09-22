.PHONY: version
version:
	git tag $(V)
	./scripts/changelog.sh
	git add ./docs/changelogs/CHANGELOG_$(V).md
	git commit --allow-empty -m "Build $(V)"
	git tag --delete $(V)
	git tag $(V)