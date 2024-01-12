set -x

echo $1
if [[ "$1" == "smoke" ]]; then
  DIRS_TO_CHECK=(
    "config"
    "seminars"
    "core_utils"
    "lab_7_llm"
  )
else
  DIRS_TO_CHECK=(
    "config"
    "seminars"
    "core_utils"
    "lab_7_llm"
  )
fi

python -m pylint --exit-zero --rcfile config/stage_1_style_tests/.pylintrc "${DIRS_TO_CHECK[@]}"

mypy "${DIRS_TO_CHECK[@]}"

python -m flake8 "${DIRS_TO_CHECK[@]}"

if [[ "$1" != "smoke" ]]; then
  python -m pytest -m "mark10 and lab_7_llm"
fi

