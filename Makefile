.PHONY: clean All

All:
	@echo "----------Building project:[ uwsrunner - Debug ]----------"
	@cd "uwsrunner" && "$(MAKE)" -f  "uwsrunner.mk"
clean:
	@echo "----------Cleaning project:[ uwsrunner - Debug ]----------"
	@cd "uwsrunner" && "$(MAKE)" -f  "uwsrunner.mk" clean
