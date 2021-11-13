import logging
import traceback
from .models import Keystore
from django.core import serializers
from rest_framework import views, generics, status
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from .serializers import KeystoreSerializer

logger = logging.getLogger("django")

class KeystoreBase(views.APIView):
    
    renderer_classes = [JSONRenderer]

    def get(self, request, *args, **kwargs):
        try:
            if self.kwargs.get('name') == None:
                query = Keystore.objects.all()
            else:
                query = Keystore.objects.filter(name=self.kwargs.get('name'))
            response = serializers.serialize('json', query)
            return Response(response)
        except:
            logger.error(traceback.format_exc())
            Response(serializer.errors, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def post(self, request, *args, **kwargs):
        try:
            serializer = KeystoreSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            logger.error(traceback.format_exc())
            Response(serializer.errors, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def put(self, request, *args, **kwargs):
        try:
            target = Keystore.objects.get(name=self.kwargs.get('name'))
            serializer = KeystoreSerializer(target, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            logger.error(traceback.format_exc())
            Response(serializer.errors, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def delete(self, request, *args, **kwargs):
        try:
            target = Keystore.objects.filter(name=self.kwargs.get('name'))
            if target:
                target.delete()
                return Response(status=status.HTTP_204_NO_CONTENT)
            return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            logger.error(traceback.format_exc())
            Response(serializer.errors, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
