REPO=""

ID=$(gh api '/repos/$(REPO)/code-scanning/analyses?tool_name=codeql' | jq -r '.[0] | .id')
gh api \
        -H "Accept: application/sarif+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        /repos/$(REPO)/code-scanning/analyses/$ID > codeql/$ID.sarif

# download last 8 files
# ids=$(gh api '/repos/$(REPO)/code-scanning/analyses | jq -r '.[] | .id' | head -n 8)
# echo $ids | while read -r id;
# do
#     gh api \
#         -H "Accept: application/sarif+json" \
#         -H "X-GitHub-Api-Version: 2022-11-28" \
#         /repos/$(REPO)/code-scanning/analyses/$id > codescanning/$id.sarif
#     echo ./codescanning/$id.sarif
# done

# pip install sarif-tools
# sarif copy --output out.sarif  codescanning
# sarif info out.sarif
