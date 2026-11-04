# 1. TP, FP, FN, TN 값을 사용자 입력을 통해 받도록 변경[cite: 1]
TP = int(input("TP 값을 입력하세요: "))
FP = int(input("FP 값을 입력하세요: "))
FN = int(input("FN 값을 입력하세요: "))
TN = int(input("TN 값을 입력하세요: "))

# 전체 데이터 수[cite: 1]
N = TP + FP + FN + TN

# 2. 빈칸의 코드 완성 (성능 평가 지표 계산)[cite: 1]
accuracy = (TP + TN) / N
sensitivity = TP / (TP + FN)
specificity = TN / (TN + FP)
precision = TP / (TP + FP)
npv = TN / (TN + FN)
f1_score = 2 * precision * sensitivity / (precision + sensitivity)
error_rate = (FP + FN) / N

# 혼동행렬 출력[cite: 1]
print("\n========== 혼동행렬 ==========")
print("             실제 +    실제 -")
print(f"예측 +       {TP:5d}     {FP:5d}")
print(f"예측 -       {FN:5d}     {TN:5d}")

# 성능 평가 출력[cite: 1]
print("\n========== 성능 평가 ==========")
print(f"정확도 Accuracy       : {accuracy:.2%}")
print(f"민감도 Sensitivity    : {sensitivity:.2%}")
print(f"특이도 Specificity    : {specificity:.2%}")
print(f"정밀도 Precision      : {precision:.2%}")
print(f"음성예측도 NPV        : {npv:.2%}")
print(f"F1-score              : {f1_score:.2%}")
print(f"오분류율 Error Rate   : {error_rate:.2%}")