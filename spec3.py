import openpyxl

# 데이터 추출
data = []

with open("spec2.data", "r") as file:
    for line in file:
        data.append(line.strip())

hostname = data[0].split(":")[1].strip()
cpu_info = data[1].split(":")[1].strip()
memory_info = data[2].split(":")[1].strip()
disk_info = data[3].split(":")[1].strip()
release = data[4].split(":")[1].strip()
public_ip = data[5].split(":")[1].strip()
lb_ip = data[6].split(":")[1].strip()

# Excel 파일 생성
workbook = openpyxl.load_workbook("server_specs.xlsx")
sheet = workbook.active

# 데이터 추가
sheet["A4"] = hostname
sheet["B4"] = cpu_info
sheet["C4"] = memory_info
sheet["D4"] = disk_info

# release 값을 소문자로 변환하여 검사
release_lower = release.lower()

if "centos" in release_lower:
    sheet["E4"] = release
elif "rhel" in release_lower:
    sheet["F4"] = release
elif "ubuntu" in release_lower:
    sheet["G4"] = release
elif "windows" in release_lower:
    sheet["H4"] = release

sheet["I4"] = public_ip
sheet["J4"] = lb_ip

# Excel 파일 저장
workbook.save("server_specs.xlsx")
