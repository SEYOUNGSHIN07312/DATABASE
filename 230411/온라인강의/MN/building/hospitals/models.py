# from django.db import models


# # Create your models here.
# class Doctor(models.Model):
#     name = models.TextField()

#     def __str__(self):
#         return f'{self.name} 전문의'
    
    
# class Patient(models.Model):
#     # doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
#     name = models.TextField()

#     def __str__(self):
#         return f'{self.pk}번 환자 {self.name}'
    

# # 중개 모델 -> 환자와 의사를 이어주는 역할
# # 보통 FK 이외에 추가 데이터를 사용하려는 경우 중개 모델 사용
# class Reservation(models.Model):
#     # FK, FK로 연결해줌
#     doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
#     patient = models.ForeignKey(Patient, on_delete=models.CASCADE)

#     # FK는 doctor_id 이런 식으로 컬럼이 생성됨
#     def __str__(self):
#         return f'{self.doctor_id}번 의사의 {self.patient_id}번 환자'
    
'''
ManyToManyField 실습
'''


from django.db import models


# Create your models here.
class Doctor(models.Model):
    name = models.TextField()

    def __str__(self):
        return f'{self.name} 전문의'
    
    
class Patient(models.Model):
    doctors = models.ManyToManyField(Doctor, through='Reservation')
    # related_name 설정해두면
    # doctor1.patient_set.all()이 아니라 doctor1.patients.all()로 접근 가능
    # doctors = models.ManyToManyField(Doctor, related_name='patients')
    name = models.TextField()

    def __str__(self):
        return f'{self.pk}번 환자 {self.name}'
 

# 추가 데이터 필요한 경우 중개 테이블 직접 설정
class Reservation(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    
    symptom = models.TextField()
    reserved_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.doctor.pk}번 의사의 {self.patient.pk}번 환자'