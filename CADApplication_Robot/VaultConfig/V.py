import requests

# Vault URL and Token
vault_url = "http://192.168.1.87:8200/v1/secret/Automation_Configuration/projects/Innovation_QA"
vault_token = "7335292d-02fd-7fb9-e6bd-e8937c527ec0"

# Function to fetch data from Vault and return it as JSON
def fetch_data_from_vault():
    headers = {"X-Vault-Token": vault_token}
    response = requests.get(vault_url, headers=headers)
    data = response.json()
    return data

# Function to get MLComposerAdmin details
def get_ml_composer_admin_details():
    data = fetch_data_from_vault()
    ml_composer_admin_details = data["data"] ["MLComposerAdmindetails"]
    ml_composer_admin_url = ml_composer_admin_details["MLComposerAdminUrl"]
    ml_composer_username = ml_composer_admin_details["MLComposerUsername"]
    ml_composer_password = ml_composer_admin_details["MLComposerPassword"]
    return ml_composer_admin_url, ml_composer_username, ml_composer_password


# Example usage

ml_composer_admin_url, ml_composer_username, ml_composer_password = get_ml_composer_admin_details()
print("ML Composer Admin URL:", ml_composer_admin_url)
print("ML Composer Admin Username:", ml_composer_username)
print("ML Composer Admin Password:", ml_composer_password)