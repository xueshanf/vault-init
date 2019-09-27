include env.mk

.PHONY: gbuild
gbuild: 
	@gcloud builds submit \
	--no-source \
	--async \
	--config=gbuild.yml \
	--substitutions=_APP_IMAGE_SRC="${APP_IMAGE_SRC}",_DESTINATION_TAG="${APP_IMAGE_FROM_GCR}" 
	
