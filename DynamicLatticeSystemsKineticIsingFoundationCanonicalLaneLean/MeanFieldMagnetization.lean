import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure MeanFieldMagnetizationPackage where
  orderParameter : Type u
  selfConsistencyEquation : Prop
  criticalTemperature : Prop
  phaseTransition : Prop

def meanFieldMagnetizationClosed (M : MeanFieldMagnetizationPackage) : Prop :=
  M.selfConsistencyEquation ∧ M.criticalTemperature ∧ M.phaseTransition

theorem mean_field_magnetization_closed_iff (M : MeanFieldMagnetizationPackage) :
  meanFieldMagnetizationClosed M := by
  exact And.intro M.selfConsistencyEquation (And.intro M.criticalTemperature M.phaseTransition)

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse