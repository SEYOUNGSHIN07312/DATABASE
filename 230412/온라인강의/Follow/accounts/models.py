from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class User(AbstractUser):
    # 서로 같이 팔로우할 필요 없음 -> 대칭 불필요
    followings = models.ManyToManyField('self', symmetrical=False, related_name='followers')
