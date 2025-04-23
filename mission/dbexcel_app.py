import streamlit as st
import pandas as pd
import pymssql
import pymysql
from io import BytesIO

# DB 연결 함수
def connect_to_db(db_type, host, user, password, database, port):
    try:
        if db_type == 'mssql':
            return pymssql.connect(host=host, user=user, password=password, database=database, port=port or 1433)
        elif db_type == 'mysql':
            return pymysql.connect(host=host, user=user, password=password, database=database, port=port or 3306)
        else:
            st.error("❌ 지원하지 않는 DB 타입입니다.")
            return None
    except Exception as e:
        st.error(f"❌ 데이터베이스 연결 실패: {e}")
        return None

# 엑셀 파일로 변환
def to_excel(df):
    output = BytesIO()
    with pd.ExcelWriter(output, engine='openpyxl') as writer:
        df.to_excel(writer, index=False, sheet_name='Sheet1')
    output.seek(0)
    return output

# Streamlit 앱 시작
st.title("📦 DB → Excel 추출기")

st.sidebar.header("1️⃣ 데이터베이스 설정")
db_type = st.sidebar.selectbox("DB 타입 선택", ["mssql", "mysql"])
host = st.sidebar.text_input("호스트 (예: localhost)")
port = st.sidebar.number_input("포트", value=1433 if db_type == "mssql" else 3306)
user = st.sidebar.text_input("사용자명")
password = st.sidebar.text_input("비밀번호", type="password")
database = st.sidebar.text_input("데이터베이스 이름")

st.sidebar.header("2️⃣ 쿼리 입력")
query = st.sidebar.text_area("SQL 쿼리 입력", height=150)

if st.sidebar.button("쿼리 실행"):
    try:
        conn = connect_to_db(db_type, host, user, password, database, port)
        if conn:
            df = pd.read_sql(query, conn)
            st.success(f"✅ 데이터 조회 완료: {len(df)}행")
            st.dataframe(df)

            excel_data = to_excel(df)
            st.download_button(
                label="📥 엑셀 다운로드",
                data=excel_data,
                file_name="query_result.xlsx",
                mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            )
    except Exception as e:
        st.error(f"🚨 오류 발생: {e}")
