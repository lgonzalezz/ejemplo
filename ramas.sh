#Imprime valores
echo "GIT_BRANCH: $GIT_BRANCH"
echo "CHANGE_BRANCH (rama origen): $CHANGE_BRANCH"
echo "CHANGE_TARGET (rama destino): $CHANGE_TARGET"    
# Get Source and Target Branches
sourceBranch=$CHANGE_BRANCH
targetBranch=$CHANGE_TARGET

# Evaluate targetBranch
case $targetBranch in
  main)
    case $sourceBranch in
         release/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
        hotfix/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo "Rama no permitida. Solo se permiten las ramas release y hotfix para integrar a main"
            exit 1
            ;;
        esac
  ;;
  master)

    case $sourceBranch in
          release/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
        hotfix/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo 'Rama no permitida. Solo se permiten las ramas release y hotfix para integrar a master'
            exit 1
            ;;
        esac
  ;;
 release/*)

    case $sourceBranch in
        QA)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo 'Rama no permitida. Solo se permite la rama QA para integrar a release'
            exit 1
            ;;
        esac
  ;;
  QA)

    case $sourceBranch in
          develop)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo 'Rama no permitida. Solo se permite la rama develop para integrar a QA'
            exit 1
            ;;
        esac
  ;;
develop)

    case $sourceBranch in
          team/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo "Rama no permitida. Solo se permiten las ramas team para integrar a develop"
            exit 1
            ;;
        esac
  ;;
team/*)

    case $sourceBranch in
          feature/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          task-resolution/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo "Rama no permitida. Solo se permiten las ramas feature y de task-resolution para integrar a team"
            exit 1
            ;;
        esac
  ;;
hotfix/*)

    case $sourceBranch in
          task/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo "Rama no permitida. Solo se permiten las ramas de task para integrar a hotfix"
            exit 1
            ;;
        esac
  ;;
feature/*)

    case $sourceBranch in
          task/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          task-resolution/*)
             echo 'PR correcto, rama origen '  $sourceBranch
        ;;
          *)
            echo "Rama no permitida. Solo se permiten las ramas task y task-resolution para integrar a feature"
            exit 1
            ;;
        esac
  ;;
  *)
    #echo "##vso[task.logissue type=error]Rama no permitida. Solo se permiten PRs a ramas feature, team, sprint, develop, QA, release, master y main"
    #exit 1
    ;;
esac
