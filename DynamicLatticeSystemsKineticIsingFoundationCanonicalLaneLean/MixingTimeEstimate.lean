import DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingAdmittedObject

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure MixingTimeEstimatePackage where
  spectralGap : ℝ
  logSobolevConstant : ℝ
  mixingTimeBound : ℝ
  spectralGapPositive : spectralGap > 0
  logSobolevPositive : logSobolevConstant > 0
  mixingTimeFromGap : mixingTimeBound = (log (Finset.card (LatticeSpinConfig ℤ))) / (2 * spectralGap)

structure MixingTimeEvidence (M : MixingTimeEstimatePackage) where
  spectralGapPositiveClosed : M.spectralGapPositive
  logSobolevPositiveClosed : M.logSobolevPositive
  mixingTimeFromGapClosed : M.mixingTimeFromGap

def MixingTimeEstimateClosed (M : MixingTimeEstimatePackage) : Prop :=
  M.spectralGapPositive ∧ M.logSobolevPositive ∧ M.mixingTimeFromGap

theorem mixing_time_estimate_closed_from_evidence (M : MixingTimeEstimatePackage) (E : MixingTimeEvidence M) :
    MixingTimeEstimateClosed M := by
  exact And.intro E.spectralGapPositiveClosed (And.intro E.logSobolevPositiveClosed E.mixingTimeFromGapClosed)

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse